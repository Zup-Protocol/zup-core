extension BigIntExtension on BigInt {
  /// Convert a bigInt to its hex string representation.
  /// E.g 32 -> 20 (which is the hex representation of 32)
  String toHex({int bitSize = 256}) {
    if (!isNegative) return toRadixString(16);
    final BigInt twoComplement = BigInt.from(1) << bitSize;

    return (twoComplement + this).toRadixString(16);
  }
}
