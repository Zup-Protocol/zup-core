import 'package:flutter/widgets.dart';

extension TextEdititingControllerExtension on TextEditingController {
  /// Parse the text from the controller to double. Also works for int.
  ///
  /// Throws if the text is not a double or int
  double get parseTextToDouble => double.parse(text);

  /// Try parse the text from the controller to double. Also works for int.
  ///
  /// in case that the text is not a double or int, returns null
  double? get tryParseTextToDouble => double.tryParse(text);

  /// Parse the text from the controller to double. Also works for int. If the text is not a double or int, returns 0
  double get parseTextToDoubleOrZero => double.tryParse(text) ?? 0;

  /// Parse the text from the controller to int. Do not works for double. If the text is not a int, returns 0
  int get parseTextToIntOrZero => int.tryParse(text) ?? 0;

  /// Parse the text from the controller to int. Do not works for double.
  ///
  /// Throws if the text is not a int
  int get parseTextToInt => int.parse(text);

  /// Try parse the text from the controller to int. Do not works for double.
  ///
  /// in case that the text is not a int, returns null
  int? get tryParseTextToInt => int.tryParse(text);
}
