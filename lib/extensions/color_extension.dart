import 'package:flutter/material.dart';

extension ColorExtension on Color {
  /// Lightens the color by blending it with white.
  ///
  /// [by] is a value between 0.0 and 1.0, where:
  /// - 0.0 returns the original color.
  /// - 1.0 returns pure white.
  Color lighter(double by) {
    return Color.lerp(this, Colors.white, by)!;
  }

  /// Darkens the color by blending it with black.
  ///
  /// [by] is a value between 0.0 and 1.0, where:
  /// - 0.0 returns the original color.
  /// - 1.0 returns pure black
  Color darker(double by) {
    return Color.lerp(this, Colors.black, by)!;
  }
}
