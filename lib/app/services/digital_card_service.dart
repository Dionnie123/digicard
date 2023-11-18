import 'dart:async';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/services/user_service.dart';
import 'package:flutter_ez_core/extensions/string_extension.dart';
import 'package:mime/mime.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import '../app.locator.dart';

class DigitalCardService with ListenableServiceMixin {
  final log = getLogger('DigitalCardService');
  final _supabase = Supabase.instance.client;
  final _userService = locator<UserService>();

  var uuid = const Uuid();

  errorMessage(String? message) {
    final String error = "$message".trim();
    if (error.isEmpty || error == "null") {
      return Future.error("Unknown error");
    }
    if (error.contains("Failed host lookup")) {
      return Future.error("Check your internet connection");
    }
    return Future.error(error);
  }

  DigitalCardService() {
    listenToReactiveValues([
      _userService,
      _digitalCards,
    ]);
  }

  final ReactiveValue<List<DigitalCardDTO>> _digitalCards =
      ReactiveValue<List<DigitalCardDTO>>([]);

  Future<String?> imageSave(Uint8List? image,
      {required String folderPath}) async {
    try {
      var mime = lookupMimeType('', headerBytes: image);
      var extension = extensionFromMime("$mime");
      final fileName = '${uuid.v4()}.$extension';
      if (image != null) {
        await Supabase.instance.client.storage.from('images').uploadBinary(
              "$folderPath/$fileName",
              image,
              fileOptions: const FileOptions(
                cacheControl: '3600',
                upsert: true,
              ),
            );
        return fileName;
      } else {
        return null;
      }
    } catch (e) {
      log.e("imageSave() : ${e.toString()}");
      return null;
    }
  }

  Future<String?> imageCopy(
      {required String sourceFileName, required String folderPath}) async {
    log.w("$sourceFileName $folderPath");
    String extension = StringExtension.fileExtension(sourceFileName);
    final fileName = '${uuid.v4()}.$extension';
    try {
      await _supabase.storage.from("images").copy(
            "$folderPath/$sourceFileName",
            "$folderPath/$fileName",
          );
      return fileName;
    } catch (e) {
      /// A weird supabase file copy bug that returns exception
      /// even if the operation is successful
      if (e.toString().contains("Expected a value of type 'String'")) {
        return fileName;
      }
      log.e("imageCopy() : ${e.toString()}");
      return null;
    }
  }

  Future imageDelete({required String folderPath}) async {
    try {
      await _supabase.storage.from('images').remove([folderPath]);
    } catch (e) {
      log.e("imageDelete() : ${e.toString()}");
    }
  }

  Future getAll() async {
    try {
      final data = await _supabase
          .from('cards')
          .select('*')
          .in_('user_id', [_userService.userId]).order(
        'created_at',
        ascending: true,
      );
      if (data is List && data.isNotEmpty) {
        _digitalCards.value =
            data.map((e) => DigitalCardDTO.fromJson(e)).toList();
      }
    } catch (e) {
      return errorMessage(e.toString());
    }
  }

  List<DigitalCardDTO> get digitalCards {
    return _digitalCards.value.reversed.toList();
  }

  set digitalCards(val) {
    _digitalCards.value = val;
  }

  Future create(DigitalCardDTO card) async {
    try {
      final data = DigitalCardExtension.toMapCreate(
          card.copyWith(userId: _userService.userId ?? "").toJson());

      data["avatar_url"] = await imageSave(
        card.avatarFile,
        folderPath: 'avatars',
      );
      data["logo_url"] = await imageSave(
        card.logoFile,
        folderPath: 'logos',
      );
      final insertedCard = await _supabase.from('cards').insert(data).select();
      if (insertedCard is List<dynamic>) {
        _digitalCards.value.add(DigitalCardDTO.fromJson(insertedCard[0]));
        notifyListeners();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future update(DigitalCardDTO card) async {
    try {
      final data = DigitalCardExtension.toMapUpdate(card.toJson());
      print(data["color"]);
      final oldAvatar = data["avatar_url"];
      final oldLogo = data["logo_url"];

      if (card.avatarFile is Uint8List) {
        await imageSave(
          card.avatarFile,
          folderPath: 'avatars',
        ).then((value) async {
          data["avatar_url"] = value;
        });
      }
      if (card.avatarFile is bool && card.avatarFile == false) {
        await imageDelete(folderPath: "avatars/$oldAvatar");
        data["avatar_url"] = "";
      }

      if (card.logoFile is Uint8List) {
        await imageSave(
          card.logoFile,
          folderPath: 'logos',
        ).then((value) async {
          data["logo_url"] = value;
        });
      }
      if (card.logoFile is bool && card.logoFile == false) {
        await imageDelete(folderPath: "logos/$oldLogo");
        data["logo_url"] = "";
      }

      final updatedCard =
          await _supabase.from('cards').update(data).eq('id', card.id).select();
      if (updatedCard is List<dynamic>) {
        final index =
            _digitalCards.value.indexWhere((element) => element.id == card.id);
        _digitalCards.value[index] = DigitalCardDTO.fromJson(updatedCard[0]);
        notifyListeners();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future delete(DigitalCardDTO card) async {
    try {
      if (card.avatarUrl.toString().isNotEmpty) {
        await imageDelete(folderPath: "avatars/${card.avatarUrl}");
      }
      if (card.logoUrl.toString().isNotEmpty) {
        await imageDelete(folderPath: "logos/${card.logoUrl}");
      }
      await _supabase.from('cards').delete().eq('id', card.id);
      _digitalCards.value.removeWhere((element) => element.id == card.id);
      notifyListeners();
    } catch (e) {
      return errorMessage(e.toString());
    }
  }

  duplicate(DigitalCardDTO card) async {
    try {
      final data = DigitalCardExtension.toMapCreate(
          card.copyWith(userId: _userService.userId ?? "").toJson());

      final originalCard =
          _digitalCards.value.firstWhere((e) => e.id == card.id);

      final bool isCopyOriginalAvatar =
          card.avatarUrl == originalCard.avatarUrl;
      final bool isUploadNewAvatar =
          card.avatarUrl == "&!&" && card.avatarFile != null;

      if (isCopyOriginalAvatar) {
        data["avatar_url"] = await imageCopy(
            sourceFileName: originalCard.avatarUrl.toString(),
            folderPath: 'avatars');
      }
      if (isUploadNewAvatar) {
        data["avatar_url"] =
            await imageSave(card.avatarFile, folderPath: 'avatars');
      }

      final bool isCopyOriginalLogo = card.logoUrl == originalCard.logoUrl;
      final bool isUploadNewLogo =
          card.logoUrl == "&!&" && card.logoFile != null;

      if (isCopyOriginalLogo) {
        data["logo_url"] = await imageCopy(
            sourceFileName: originalCard.logoUrl.toString(),
            folderPath: 'logos');
      }

      if (isUploadNewLogo) {
        data["logo_url"] = await imageSave(card.logoFile, folderPath: 'logos');
      }

      final insertedCard = await _supabase.from('cards').insert(data).select();

      if (insertedCard is List<dynamic>) {
        DigitalCardDTO? temp = DigitalCardDTO.fromJson(insertedCard[0]);
        _digitalCards.value.add(temp);
        notifyListeners();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<DigitalCardDTO?> findOne(String uuid) async {
    final data = await _supabase.from('cards').select().eq('uuid', uuid);
    if (data is List && data.isNotEmpty) {
      return DigitalCardDTO.fromJson(data[0]);
    }
    return null;
  }
}
