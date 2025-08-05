import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/zup_core.dart';

void main() {
  test(
    "When calling 'isLight' and the brightness is indeed light, it should return true",
    () {
      expect(Brightness.light.isLight, true);
    },
  );

  test(
    "When calling 'isDark' and the brightness is indeed dark, it should return true",
    () {
      expect(Brightness.dark.isDark, true);
    },
  );

  test(
    "When calling 'isLight' and the brightness is dark, it should return false",
    () {
      expect(Brightness.dark.isLight, false);
    },
  );

  test(
    "When calling 'isDark' and the brightness is light, it should return false",
    () {
      expect(Brightness.light.isDark, false);
    },
  );
}
