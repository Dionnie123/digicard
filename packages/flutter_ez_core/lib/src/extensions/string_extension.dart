extension StringExtension on String {
  static String getFileExtension(String fileName) {
    try {
      return fileName.split('.').last;
    } catch (e) {
      return '';
    }
  }

  /// ensures that string has real value
  bool isNotNullOrEmpty() {
    final x = ["null", "Null", "NULL", ""];
    return x.contains(trim()) == false;
  }

  /// checks if the string is a valid url
  bool isValidUrl() {
    return Uri.parse(this).isAbsolute;
  }

  String toCapitalCase() {
    return isNotEmpty
        ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
        : '';
  }

  String toTitleCase() {
    return replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.toCapitalCase())
        .join(' ');
  }

  String clean() {
    return replaceAll(RegExp(r'\bnull\b', caseSensitive: false), '')
        .replaceAll(RegExp(r"\s+"), " ")
        .trim();
  }
}
