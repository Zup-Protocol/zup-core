import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/zup_holder.dart';

void main() {
  test(
      "When using hold, it should only run the action one per time, waiting for the previous action to finish",
      () {
    int counter = 0;
    final holder = ZupHolder();

    holder.hold(() async {
      counter++;
      await Future.delayed(const Duration(seconds: 1000));
    });

    holder.hold(() async {
      counter++;
      await Future.delayed(const Duration(seconds: 1000));
    });

    expect(counter, 1);
  });
}
