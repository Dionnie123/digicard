import 'package:digicard/app/env/env.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:flutter_ez_core/extensions/string_extension.dart';

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
    value.remove("custom_links");
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
}
