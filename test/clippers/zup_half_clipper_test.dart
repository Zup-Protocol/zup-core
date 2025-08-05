import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/clippers/zup_half_clipper.dart';

void main() {
  test(
    "ZupHalfClipperSide `isLeft` should return true if the side is left",
    () {
      expect(ZupHalfClipperSide.left.isLeft, true);
    },
  );

  test(
    "ZupHalfClipperSide `isRight` should return true if the side is right",
    () {
      expect(ZupHalfClipperSide.right.isRight, true);
    },
  );
}
