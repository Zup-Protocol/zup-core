import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/zup_core.dart';

void main() {
  test(
    "`toHex` should return a hex string representation of the passed bigint number",
    () {
      BigInt bigInt = BigInt.parse('32');
      String hexString = bigInt.toHex();

      expect(hexString, '20');
    },
  );

  test(
    "When passing a negative number to `toHex`, should return a hex string representation of the passed bigint number",
    () {
      BigInt bigInt = BigInt.parse('-32');
      String hexString = bigInt.toHex();

      expect(
        hexString,
        'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0',
      );
    },
  );

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

  test("When calling 'mulDiv' with a zero denominator, it should throw", () {
    BigInt bigInt = BigInt.parse('32');
    BigInt denominator = BigInt.zero;

    expect(() => bigInt.mulDiv(denominator, denominator), throwsArgumentError);
  });

  test(
    "When calling 'mulDiv' it should multiply number a by number b, and then divide by the denominator",
    () {
      BigInt numberA = BigInt.parse('32');
      BigInt numberB = BigInt.parse('32');
      BigInt denominator = BigInt.parse('2');

      expect(numberA.mulDiv(numberB, denominator), BigInt.from(512));
    },
  );

  test(
    "When calling 'mulDivRoundingUp' with a zero denominator, it should throw",
    () {
      BigInt bigInt = BigInt.parse('1111');
      BigInt denominator = BigInt.zero;

      expect(
        () => bigInt.mulDivRoundingUp(denominator, denominator),
        throwsArgumentError,
      );
    },
  );

  test(
    """When calling 'mulDivRoundingUp' it should multiply number a by number b,
    and then divide by the denominator and round up if the result is not an integer""",
    () {
      BigInt numberA = BigInt.parse('37');
      BigInt numberB = BigInt.parse('31');
      BigInt denominator = BigInt.parse('2');

      expect(numberA.mulDivRoundingUp(numberB, denominator), BigInt.from(574));
    },
  );

  test(
    """When calling 'mulDivRoundingUp' it should multiply number a by number b,
    and then divide by the denominator. If the result is an integer, it should be returned""",
    () {
      BigInt numberA = BigInt.parse('37');
      BigInt numberB = BigInt.parse('32');
      BigInt denominator = BigInt.parse('2');

      expect(numberA.mulDivRoundingUp(numberB, denominator), BigInt.from(592));
    },
  );

  test(
    "When callin 'divRoundingUp' with a zero denominator, it should throw",
    () {
      BigInt bigInt = BigInt.parse('32');
      BigInt denominator = BigInt.zero;

      expect(() => bigInt.divRoundingUp(denominator), throwsArgumentError);
    },
  );

  test(
    "When calling 'divRoundingUp' it should divide number a by number b and round up if the result is not an integer",
    () {
      BigInt numberA = BigInt.parse('37');
      BigInt numberB = BigInt.parse('31');

      expect(numberA.divRoundingUp(numberB), BigInt.from(2));
    },
  );

  test(
    "When calling 'divRoundingUp' it should divide number a by number b. If the result is an integer, it should be returned",
    () {
      BigInt numberA = BigInt.parse('12');
      BigInt numberB = BigInt.parse('4');

      expect(numberA.divRoundingUp(numberB), BigInt.from(3));
    },
  );
}
