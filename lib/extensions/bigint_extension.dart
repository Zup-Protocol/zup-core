extension BigIntExtension on BigInt {
  /// Convert a bigInt to its hex string representation.
  /// E.g 32 -> 20 (which is the hex representation of 32)
  String toHex({int bitSize = 256}) {
    if (!isNegative) return toRadixString(16);
    final BigInt twoComplement = BigInt.from(1) << bitSize;

    return (twoComplement + this).toRadixString(16);
  }

  /// Multiplies then divides the result by a denominator
  ///
  /// Throws an error if the denominator is zero
  BigInt mulDiv(BigInt b, BigInt denominator) {
    if (denominator == BigInt.zero) {
      throw ArgumentError("Denominator cannot be zero");
    }

    return (this * b) ~/ denominator;
  }

  /// Multiplies then divides the result by a denominator, rounding up if the result is not an integer
  BigInt mulDivRoundingUp(BigInt b, BigInt denominator) {
    if (denominator == BigInt.zero) {
      throw ArgumentError("Denominator cannot be zero");
    }

    final result = (this * b) ~/ denominator;

    if ((this * b).remainder(denominator) > BigInt.zero) {
      return result + BigInt.one;
    }

    return result;
  }

  /// Divides and rounds up if the result is not an integer
  BigInt divRoundingUp(BigInt b) {
    if (b == BigInt.zero) {
      throw ArgumentError("Division by zero");
    }

    final result = this ~/ b;

    if (this % b != BigInt.zero) return result + BigInt.one;
    return result;
  }
}
