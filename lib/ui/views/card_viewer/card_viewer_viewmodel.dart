import 'dart:typed_data';
import 'dart:ui';
import 'package:digicard/app/app.bottomsheets.dart';
import 'package:digicard/app/app.dialogs.dart';
import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/extensions/contacts_service_extension.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/contacts_service.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/app/services/native_contacts_service.dart';
import 'package:flutter_ez_core/helpers/image_cache_downloader.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CardViewerViewModel extends ReactiveViewModel {
  final log = getLogger('CardViewerViewModel');
  final _supabase = Supabase.instance.client;
  User? get user => _supabase.auth.currentUser;

  final _contactsService = locator<ContactsService>();
  final _nativeContactsService = locator<NativeContactsService>();
  final _digitalCardService = locator<DigitalCardService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<RouterService>();

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());
    super.onFutureError(error, key);
  }

  late DigitalCard card;
  DisplayType displayType = DisplayType.public;
  Color get color => card.color;
  bool isDarkMode = false;

  Future start({
    DigitalCard? cardParam,
    DisplayType? displayTypeParam,
    String? uuid,
  }) async {
    setBusyForObject(loadingImagesBusyKey, true);
    card = cardParam ?? DigitalCard.blank();
    displayType = displayTypeParam ?? DisplayType.public;

    if (uuid != null) {
      await runBusyFuture(loadCardbyUuid(uuid),
          throwException: true, busyObject: loadingCardBusyKey);
    }

    Uint8List? avatar;
    Uint8List? logo;
    await runBusyFuture(
        Future.wait([
          imageCacheDownload(card.avatarHttpUrl)
              .then((value) => avatar = value),
          imageCacheDownload(card.logoHttpUrl).then((value) => logo = value)
        ]),
        throwException: true,
        busyObject: loadingImagesBusyKey);

    card = card.copyWith(avatarFile: avatar, logoFile: logo);
  }

  bool isUserPresent() => user != null;
  bool isCardOwnedByUser() => card.isOwnedBy(user?.id);
  bool isCardInContacts() => _contactsService.isExist(id: card.id);

  Future loadCardbyUuid(String uuid) async {
    card = await _digitalCardService.findOne(uuid) ?? DigitalCard.blank();
  }

  Future downloadVcf() async {
    await runBusyFuture(_nativeContactsService.download(card),
        throwException: true, busyObject: saveBusyKey);
  }

  Future saveToContacts() async {
    await runBusyFuture(
        Future.wait([
          _contactsService.create(card),
          _nativeContactsService.save(card),
        ]),
        throwException: true,
        busyObject: saveBusyKey);
    setBusyForObject(doneBusyKey, true);
    await Future.delayed(const Duration(seconds: 1));
    setBusyForObject(doneBusyKey, false);
  }

  showOptions() {
    _bottomSheetService
        .showCustomSheet(variant: BottomSheetType.delete, data: color)
        .then((value) async {
      if (value?.confirmed == true) {
        await delete(card.id);
      }
    });
  }

  Future delete(int? id) async {
    final dialogResponse = await _dialogService.showCustomDialog(
      variant: DialogType.confirm,
      title: "Card Delete",
      description: "You sure you want to delete this contact?",
      mainButtonTitle: "Delete",
      barrierDismissible: true,
    );
    if (dialogResponse?.confirmed ?? false) {
      await runBusyFuture(
        _contactsService.delete(card),
        busyObject: deleteBusyKey,
        throwException: true,
      );
      _navigationService.back();
    }
    return null;
  }
}
