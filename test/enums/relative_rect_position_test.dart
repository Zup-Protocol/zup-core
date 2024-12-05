import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/enums/relative_rect_position.dart';

void main() {
  test(
    "`getVerticalPosition`should return vertical position as 0 for onTop",
    () {
      expect(RelativePosition.onTop.getVerticalPosition(100), 0);
    },
  );

  test(
    "`getVerticalPosition`should return vertical position as the negative of the passed value for above",
    () {
      expect(RelativePosition.above.getVerticalPosition(100), -100);
    },
  );

  test(
    "`getVerticalPosition`should return vertical position as the passed value for below",
    () {
      expect(RelativePosition.below.getVerticalPosition(100), 100);
    },
  );
}
