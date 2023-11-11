import 'package:digicard/app/env/env.dart';
import 'package:digicard/app/models/digital_card.dart';

extension DigitalCardExtension on DigitalCard {
  String fullName() {
    return "$accreditations $prefix  $firstName $middleName $lastName  $suffix";
  }

  String get avatarHttpUrl {
    return "${Env.supabaseAvatarUrl}$avatarUrl";
  }

  String get logoHttpUrl {
    return "${Env.supabaseLogoUrl}$logoUrl";
  }

  bool isOwnedBy(val) {
    return userId == val;
  }

  static Map<String?, dynamic> toMapCreate(Map<String, dynamic> value) {
    value.remove("id");
    value.remove("uuid");
    value.remove("added_at");
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
    value.remove("added_at");
    value.remove("created_at");
    value.remove("updated_at");
    return value;
  }
}
