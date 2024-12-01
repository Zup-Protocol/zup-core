import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/zup_core.dart';

void main() {
  test(
      "`toHex` should return a hex string representation of the passed int number",
      () {
    int intNumber = 32;
    String hexString = intNumber.toHex();

    expect(hexString, '20');
  });

  test(
      "When passing a negative number to `toHex`, should return a hex string representation of the passed int number",
      () {
    int intNumber = -32;
    String hexString = intNumber.toHex();

    expect(
      hexString,
      'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0',
    );
  });

  test(
    """When passing a negative number, and a different bitSize to `toHex`,
    should return a hex string representation of the passed int number
    correct
    """,
    () {
      int intNumber = -32;
      String hexString = intNumber.toHex(bitSize: 512);

      expect(
        hexString,
        'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0',
      );
    },
  );
}
