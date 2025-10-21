extension StringExtension on String {
  /// Convert a string value to its hex string representation.
  /// E.g "hello" -> "68656c6c6f"
  String get toHex {
    return codeUnits.map((e) => e.toRadixString(16).padLeft(2, '0')).join();
  }

  /// Check if the string is equal to [other] as case insensitive
  bool lowercasedEquals(String other) => toLowerCase() == other.toLowerCase();

  /// Clamp the string to [maxLength] and show an ellipsis if the string is longer
  ///
  /// Returns the clamped string, optionally remove the ellipsis by passing false
  /// to [showEllipsis]
  String clamped(int maxLength, {bool showEllipsis = true}) {
    if (trim().length > maxLength) {
      final clamped = substring(0, maxLength);
      return showEllipsis ? "$clamped..." : clamped;
    }

    return this;
  }

  /// Add plus sign to a string number if it's positive, keeps minus sign if it's negative
  ///
  /// E.g 123 -> +123 | -123 -> -123
  String get asSignedNumber {
    if (contains("-")) return this;

    return "+$this";
  }
}
