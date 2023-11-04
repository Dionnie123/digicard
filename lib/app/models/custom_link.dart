import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
part 'custom_link.freezed.dart';
part 'custom_link.g.dart';
part 'custom_link.gform.dart';

enum CustomLinkType { link, email, address, phone, website, more }

@freezed
@Rf()
@RfGroup()
class CustomLink with _$CustomLink {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory CustomLink({
    @Default("") @RfControl() String value,
    @Default("Link") String label,
    @Default("") @RfControl() String custom,
    @JsonKey(
      includeFromJson: false,
    )
    Widget? icon,
  }) = _CustomLink;

  factory CustomLink.fromJson(Map<String, dynamic> json) =>
      _$CustomLinkFromJson(json);

  static CustomLink empty = CustomLink(value: "", label: "Link", custom: "");
}
