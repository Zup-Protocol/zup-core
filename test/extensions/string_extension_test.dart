import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/extensions/string_extension.dart';

void main() {
  test("When passing a string to `toHex` it should convert its value to hex",
      () {
    String string = "hello";
    String hexString = string.toHex;

    expect(hexString, '68656c6c6f');
  });
}
