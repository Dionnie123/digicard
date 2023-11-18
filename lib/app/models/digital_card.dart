import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:reactive_links_picker/reactive_links_picker.dart';
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
    int? id,
    String? userId,
    String? uuid,
    String? logoUrl,
    String? avatarUrl,
    @Default("New Card") @RfControl() String? title,
    @RfControl(validators: [RequiredValidator()]) String? firstName,
    @RfControl() String? prefix,
    @RfControl() String? middleName,
    @RfControl() String? lastName,
    @RfControl() String? suffix,
    @RfControl() dynamic avatarFile,
    @RfControl() dynamic logoFile,
    @ColorConverter() @RfControl() @RfControl() Color? color,
    @RfControl() int? layout,
    @RfControl() String? position,
    @RfControl() String? company,
    @RfControl() String? headline,
    @Default([])
    @RfControl(validators: [NotEmptyValidator()])
    List<Map<String, dynamic>>? customLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? addedAt,
  }) = _DigitalCard;

  factory DigitalCard.blank() => DigitalCard();

  factory DigitalCard.fromJson(Map<String, dynamic> json) =>
      _$DigitalCardFromJson(json);
}
