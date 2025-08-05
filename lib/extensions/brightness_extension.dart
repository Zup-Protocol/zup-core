import 'dart:ui';

extension BrightnessExtension on Brightness {
  /// Get if the current brightness passed is light
  ///
  /// Returns true if the brightness passed is light.
  /// Otherwise returns false
  bool get isLight => this == Brightness.light;

  /// Get if the current brightness passed is dark
  ///
  /// Returns true if the brightness passed is dark.
  /// Otherwise returns false
  bool get isDark => this == Brightness.dark;
}
