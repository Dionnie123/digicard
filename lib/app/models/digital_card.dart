import 'package:flutter/material.dart';
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
    int? id,
    String? userId,
    String? uuid,
    @RfControl() String? firstName,
    String? logoUrl,
    String? avatarUrl,
    @Default("New Card") @RfControl() String? title,
    @RfControl() String? prefix,
    @RfControl() String? middleName,
    @RfControl() String? lastName,
    @RfControl() String? suffix,
    @RfControl() String? accreditations,
    @RfControl() String? maidenName,
    @RfControl() dynamic avatarFile, //@Uint8ListConverter()
    @RfControl() dynamic logoFile,
    @RfControl() @ColorConverter() @RfControl() Color? color,
    @RfControl() int? layout,
    @RfControl() String? position,
    @RfControl() String? department,
    @RfControl() String? company,
    @RfControl() String? headline,
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
