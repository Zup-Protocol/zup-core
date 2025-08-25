import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/extensions/text_edititing_controller_extension.dart';

void main() {
  test(
    "When calling 'parseTextToDouble' and the text is a double, it should return the double typed",
    () {
      TextEditingController controller = TextEditingController(text: "1.43");

      expect(controller.parseTextToDouble, 1.43);
    },
  );

  test(
    "When calling 'parseTextToInt' and the text is a int, it should return the int typed",
    () {
      TextEditingController controller = TextEditingController(text: "132");

      expect(controller.parseTextToInt, 132);
    },
  );

  test(
    "When calling 'parseTextToInt' and the text is a double, it should throw",
    () {
      TextEditingController controller = TextEditingController(text: "132.343");

      expect(() => controller.parseTextToInt, throwsException);
    },
  );

  test(
    "When calling 'parseTextToDouble' and the text is a int, it should convert to double",
    () {
      TextEditingController controller = TextEditingController(text: "132");

      expect(controller.parseTextToDouble, 132.0);
    },
  );

  test(
    "When calling 'parseTextToDouble' and the text is not a int or double, it should throw",
    () {
      TextEditingController controller = TextEditingController(
        text: "SAMAMMAMA",
      );

      expect(() => controller.parseTextToDouble, throwsException);
    },
  );

  test(
    "When calling 'tryParseTextToDouble' and the text is a double, it should return the double typed",
    () {
      TextEditingController controller = TextEditingController(text: "1.43");

      expect(controller.tryParseTextToDouble, 1.43);
    },
  );

  test(
    "When calling 'tryParseTextToInt' and the text is a int, it should return the int typed",
    () {
      TextEditingController controller = TextEditingController(text: "132");

      expect(controller.tryParseTextToInt, 132);
    },
  );

  test(
    "When calling 'tryParseTextToInt' and the text is a double, it should return null",
    () {
      TextEditingController controller = TextEditingController(text: "132.343");

      expect(controller.tryParseTextToInt, null);
    },
  );

  test(
    "When calling 'tryParseTextToDouble' and the text is not a int or double, it should return null",
    () {
      TextEditingController controller = TextEditingController(text: "ABAB");

      expect(controller.tryParseTextToDouble, null);
    },
  );

  test(
    "When calling 'parseTextToDoubleOrZero' and the text is a double, it should return the double typed",
    () {
      TextEditingController controller = TextEditingController(text: "1.11");

      expect(controller.parseTextToDoubleOrZero, 1.11);
    },
  );

  test(
    "When calling 'parseTextToDoubleOrZero' and the text is not a double, it should return 0",
    () {
      TextEditingController controller = TextEditingController(text: "ABAB");

      expect(controller.parseTextToDoubleOrZero, 0);
    },
  );

  test(
    "When calling 'parseTextToIntOrZero' and the text is a int, it should return the int typed",
    () {
      TextEditingController controller = TextEditingController(text: "132");

      expect(controller.parseTextToIntOrZero, 132);
    },
  );

  test(
    "When calling 'parseTextToIntOrZero' and the text is not a int, it should return 0",
    () {
      TextEditingController controller = TextEditingController(text: "ABAB");

      expect(controller.parseTextToIntOrZero, 0);
    },
  );
}
