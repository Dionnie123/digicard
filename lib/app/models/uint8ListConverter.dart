import 'dart:typed_data';
import 'dart:ui';

import 'package:digicard/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class Uint8ListConverter implements JsonConverter<Uint8List?, List<int>?> {
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(List<int>? json) {
    return json == null ? null : Uint8List.fromList(json);
  }

  @override
  List<int>? toJson(Uint8List? object) {
    return object?.toList();
  }
}

class ColorConverter implements JsonConverter<Color?, int?> {
  const ColorConverter();

  @override
  Color? fromJson(int? val) {
    return val == null ? Color(val ?? 0xFFFFA500) : const Color(0xFFFFA500);
  }

  @override
  int? toJson(Color? val) => val?.value;
}