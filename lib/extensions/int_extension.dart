import 'package:zup_core/extensions/bigint_extension.dart';

extension IntExtension on int {
  /// Convert a int to its hex string representation.
  /// E.g 32 -> 20 (which is the hex representation of 32)
  String toHex({int bitSize = 256}) {
    return BigInt.from(this).toHex(bitSize: bitSize);
  }
}
