extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String toCamelCase() {
    return split(' ').map((word) => word.capitalizeFirstLetter()).join('');
  }

  String capitalizeAll() {
    return toUpperCase();
  }

  bool containsIgnoreCase(String other) {
    return toLowerCase().contains(other.toLowerCase());
  }

  String removeWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }

  bool isNumeric() {
    return double.tryParse(this) != null;
  }

  String limit(int maxLength) {
    if (length <= maxLength) {
      return this;
    } else {
      return '${substring(0, maxLength)}...';
    }
  }

  bool startsWithIgnoreCase(String other) {
    return toLowerCase().startsWith(other.toLowerCase());
  }

  bool endsWithIgnoreCase(String other) {
    return toLowerCase().endsWith(other.toLowerCase());
  }

  String replaceAllIgnoreCase(String from, String to) {
    final regex = RegExp(from, caseSensitive: false);
    return replaceAll(regex, to);
  }

  bool isEmail() {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this);
  }

  bool isUrl() {
    final urlRegex = RegExp(
        r'^(https?:\/\/)?([a-z0-9-]+\.)+[a-z]{2,}(\/[a-z0-9\-._~:/?#[\]@!$&\()*+,;=]*)?$',
        caseSensitive: false);
    return urlRegex.hasMatch(this);
  }
}
