/// Custom Regular expressions to be used anywhere
abstract class ZupRegex {
  /// Regular expression for numbers allowing decimals with dots
  static final RegExp decimalNumbers = RegExp(r'^\d+\.?\d{0,1}');
}
