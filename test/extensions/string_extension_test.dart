import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/extensions/string_extension.dart';

void main() {
  test(
    "When passing a string to `toHex` it should convert its value to hex",
    () {
      String string = "hello";
      String hexString = string.toHex;

      expect(hexString, '68656c6c6f');
    },
  );

  test(
    "when comparing two strings with the same value but different case, `lowercasedEquals` should return true",
    () {
      String string1 = "test";
      String string2 = "TEST";

      expect(string1.lowercasedEquals(string2), true);
    },
  );

  test(
    "when comparing two strings with different values and equal case, `lowercasedEquals` should return false",
    () {
      String string1 = "test";
      String string2 = "TEST ME";

      expect(string1.lowercasedEquals(string2), false);
    },
  );

  test(
    """When passing a string that its lenght is longer than the max length to `clampMax`
    it should return the same string but clamped, with an ellipsis at the end""",
    () {
      expect("test".clamped(3), "tes...");
    },
  );

  test(
    """When passing a string that its lenght is longer than the max length to `clampMax`
    and setting false to add the ellipsis at the end, it should return the same string but clamped,
    without an ellipsis at the end""",
    () {
      expect("test".clamped(3, showEllipsis: false), "tes");
    },
  );

  test(
    """When passing a string that its lenght is not longer than the max length to `clampMax`
    it should return the same string, not clamped""",
    () {
      expect("test".clamped(4), "test");
    },
  );

  test(
    "When passing a positive number string to 'asSignedNumber' it should add a plus sign",
    () => expect('123'.asSignedNumber, '+123'),
  );

  test(
    "When passing a negative number string to 'asSignedNumber' it should keep the minus sign and not add a plus sign",
    () => expect('-123'.asSignedNumber, '-123'),
  );
}
