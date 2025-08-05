import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  /// Get the current brightness of the theme from the context.
  Brightness get brightness => Theme.of(this).brightness;
}
