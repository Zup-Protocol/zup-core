extension StringExtension on String {
  /// Convert a string value to its hex string representation.
  /// E.g "hello" -> "68656c6c6f"
  String get toHex {
    return codeUnits.map((e) => e.toRadixString(16).padLeft(2, '0')).join();
  }
}
