import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'uint8ListConverter.dart';
part 'digital_card.freezed.dart';
part 'digital_card.g.dart';
part 'digital_card.gform.dart';

@freezed
@ReactiveFormAnnotation()
class DigitalCard with _$DigitalCard {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory DigitalCard({
    required int id,
    required String userId,
    required String uuid,
    @Default("") @RfControl(validators: [RequiredValidator()]) String firstName,
    @Default("") String logoUrl,
    @Default("") String avatarUrl,
    @Default("New Card") @RfControl() String title,
    @Default("") @RfControl() String prefix,
    @Default("") @RfControl() String middleName,
    @Default("") @RfControl() String lastName,
    @Default("") @RfControl() String suffix,
    @Default("") @RfControl() String accreditations,
    @Default("") @RfControl() String maidenName,
    @Uint8ListConverter() @RfControl() Uint8List? avatarFile,
    @Uint8ListConverter() @RfControl() Uint8List? logoFile,
    @Default(kcPrimaryColor) @ColorConverter() @RfControl() Color color,
    @Default(0) @RfControl() int layout,
    @Default("") @RfControl() String position,
    @Default("") @RfControl() String department,
    @Default("") @RfControl() String company,
    @Default("") @RfControl() String headline,
    @Default([]) @RfControl() List<Map<String, dynamic>> customLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? addedAt,
  }) = _DigitalCard;

  factory DigitalCard.blank() => DigitalCard(
        id: -1,
        userId: "",
        uuid: "",
        firstName: "",
      );

  factory DigitalCard.fromJson(Map<String, dynamic> json) =>
      _$DigitalCardFromJson(json);
}
