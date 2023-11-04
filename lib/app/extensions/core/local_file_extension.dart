import 'dart:io' as io;
import 'package:validators/sanitizers.dart';
import 'package:path/path.dart' as p;

extension LocalFileExtension on String {
  bool isNotNullOrEmpty() {
    return trim(this) != "null" && trim(this) != "";
  }

  bool doesExist() {
    bool res = false;
    try {
      if (isNotNullOrEmpty()) {
        res = io.File(this).existsSync();
      }
    } catch (e) {
      return false;
    }
    return res;
  }

  io.File file() {
    return io.File(this);
  }

  String fileType() {
    return p.extension(this);
  }
}
