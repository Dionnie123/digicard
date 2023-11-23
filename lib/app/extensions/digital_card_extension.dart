import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:digicard/app/env/env.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_ez_core/extensions/string_extension.dart';

import 'package:flutter_ez_core/helpers/image_cache_downloader.dart';

extension DigitalCardExtension on DigitalCardDTO {
  String fullName() {
    return "${prefix ?? ""}  ${firstName ?? ""} ${middleName ?? ""} ${lastName ?? ""}  ${suffix ?? ""}"
        .sanitize();
  }

  String get avatarHttpUrl {
    return "${Env.supabaseAvatarUrl}$avatarUrl";
  }

  String get logoHttpUrl {
    return "${Env.supabaseLogoUrl}$logoUrl";
  }

  String get cardHttpUrl {
    return "${Env.cardUrl}$uuid";
  }

  bool isOwnedBy(val) {
    return userId == val;
  }

  static Map<String?, dynamic> toMapCreate(Map<String, dynamic> value) {
    value.remove("id");
    value.remove("uuid");
    value.remove("added_to_contacts_at");
    value.remove("created_at");
    value.remove("updated_at");
    value.remove("full_name");
    value.remove("avatar_file");
    value.remove("logo_file");
    return value;
  }

  static Map<String?, dynamic> toMapUpdate(Map<String, dynamic> value) {
    value.remove("id");
    value.remove("avatar_file");
    value.remove("logo_file");
    value.remove("added_to_contacts_at");
    value.remove("created_at");
    value.remove("updated_at");
    return value;
  }

  static Future<Contact?> toContact(DigitalCardDTO card) async {
    try {
      final links = card.customLinks ?? [];
      //Group custom links by label
      Map<String, List<Map<String, dynamic>>> customLinks =
          groupBy(links.map((e) => e).toList(), (e) {
        return e['label'];
      });
      //Downlod existing image
      Uint8List? bytes = await imageCacheDownload(card.avatarHttpUrl);

      List<Map<String, dynamic>> groupGet(String groupName) {
        return (customLinks[groupName] ?? []).map((e) {
          return e;
        }).toList();
      }

      return Future.value(Contact(
        id: card.uuid ?? "",
        //  photo: bytes,
        displayName: "${card.firstName ?? ""} ${card.lastName ?? ""}",
        name: Name(
          prefix: card.prefix ?? "",
          first: card.firstName ?? "",
          last: card.lastName ?? "",
          middle: card.middleName ?? "",
          suffix: card.suffix ?? "",
        ),
        organizations: [
          Organization(title: card.position ?? "", company: card.company ?? "")
        ],
        /*     socialMedias: [
          ...groupGet("LinkedIn").map((e) {
            return SocialMedia(
              "${e['prefix']}${e['value']}",
              customLabel: e['custom'] ?? e['label'],
            );
          }).toList(),
          ...groupGet("Facebook").map((e) {
            return SocialMedia(
              "${e['prefix']}${e['value']}",
              customLabel: e['custom'] ?? e['label'],
            );
          }).toList(),
          ...groupGet("Twitter").map((e) {
            return SocialMedia(
              "${e['prefix']}${e['value']}",
              customLabel: e['custom'] ?? e['label'],
            );
          }).toList(),
          ...groupGet("Instagram").map((e) {
            return SocialMedia(
              "${e['prefix']}${e['value']}",
              customLabel: e['custom'] ?? e['label'],
            );
          }).toList(),
          ...groupGet("Paypal").map((e) {
            return SocialMedia(
              "${e['prefix']}${e['value']}",
              customLabel: e['custom'] ?? e['label'],
            );
          }).toList()
        ], */
        notes: [Note(card.headline ?? "")],
        emails: groupGet("Email").map((e) => Email(e['value'])).toList(),
        phones: groupGet("Phone").map((e) => Phone(e['value'])).toList(),
        websites: groupGet("Website").map((e) => Website(e['value'])).toList(),
        addresses: groupGet("Address").map((e) => Address(e['value'])).toList(),
        accounts: [],
      ));
    } catch (e) {
      return Future.value();
    }
  }
}
