import 'package:flutter/widgets.dart';

extension TextEdititingControllerExtension on TextEditingController {
  /// Parse the text from the controller to double. Also works for int.
  ///
  /// Throws if the text is not a double or int
  double get parseTextToDouble => double.parse(text);

  /// Parse the text from the controller to int. Do not works for double.
  ///
  /// Throws if the text is not a int
  int get parseTextToInt => int.parse(text);
}
