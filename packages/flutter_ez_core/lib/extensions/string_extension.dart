extension StringExtension on String {
  static String fileExtension(String fileName) {
    try {
      return fileName.split('.').last;
    } catch (e) {
      return '';
    }
  }

  bool isValidUrl() {
    return Uri.parse(this).isAbsolute;
  }

  String toCapitalCase() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String toTitleCase() {
    return replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.toCapitalCase())
        .join(' ');
  }

  String sanitize() {
    String sanitizedString = replaceAll(RegExp(r'\s+'), ' ');
    sanitizedString = sanitizedString.trim();
    return sanitizedString;
  }
}
