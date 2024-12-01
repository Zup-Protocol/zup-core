import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/zup_core.dart';

void main() {
  test(
      "`toHex` should return a hex string representation of the passed bigint number",
      () {
    BigInt bigInt = BigInt.parse('32');
    String hexString = bigInt.toHex();

    expect(hexString, '20');
  });

  test(
      "When passing a negative number to `toHex`, should return a hex string representation of the passed bigint number",
      () {
    BigInt bigInt = BigInt.parse('-32');
    String hexString = bigInt.toHex();

    expect(
      hexString,
      'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0',
    );
  });

  test(
    """When passing a negative number, and a different bitSize to `toHex`,
    should return a hex string representation of the passed bigint number
    correct
    """,
    () {
      BigInt bigInt = BigInt.parse('-32');
      String hexString = bigInt.toHex(bitSize: 512);

      expect(
        hexString,
        'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0',
      );
    },
  );
}
