import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_links_picker/src/icons_list/icons.dart';
part 'custom_link.freezed.dart';
part 'custom_link.g.dart';

@freezed
class CustomLink with _$CustomLink {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory CustomLink({
    @Default("") String? value,
    @Default("") String? custom,
    @Default("Info") String? label,
    @Default("") String? prefixLink,
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    Widget? icon,
  }) = _CustomLink;

  factory CustomLink.fromJson(Map<String, dynamic> json) =>
      _$CustomLinkFromJson(json);

  static CustomLink initialize({required String label}) {
    final temp = icons.firstWhereOrNull((element) => element.label == label);
    return temp ?? CustomLink.empty;
  }

  static CustomLink empty = CustomLink(
      label: "Info",
      value: "",
      prefixLink: "",
      icon: const Icon(
        Icons.link,
      ));
}
