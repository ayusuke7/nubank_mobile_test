abstract class Validator {
  /// Check if [url] is a valid URL
  /// [url] url to check
  /// returns true if [url] is a valid URL
  static bool isURL(String url) {
    final regex = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );
    return regex.hasMatch(url);
  }
}
