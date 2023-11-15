import 'dart:typed_data';
import 'dart:ui';

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

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int? json) {
    return json == null ? Colors.orange : Color(json);
  }

  @override
  int toJson(Color? object) {
    return object?.value ?? Colors.orange.value;
  }
}
