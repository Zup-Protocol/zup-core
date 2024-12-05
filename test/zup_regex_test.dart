import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/zup_core.dart';

void main() {
  test(
      "`decimalNumbers` regex should return the correct regex for decimal numbers with dots",
      () {
    expect(ZupRegex.decimalNumbers.pattern, r'^\d+\.?\d{0,1}');
  });
}
