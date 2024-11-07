import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/zup_periodic_task.dart';

void main() {
  test(
      "When registering a new periodic task, but one has already been registered,it should assert",
      () {
    final periodicTask = ZupPeriodicTask(duration: const Duration(seconds: 10));
    periodicTask.register(() {});

    expect(() => periodicTask.register(() {}), throwsAssertionError);
  });

  test(
      "When registering a new periodic task, the callback should be called in the passed duration",
      () {
    fakeAsync((async) {
      int counter = 0;

      ZupPeriodicTask(
        duration: const Duration(seconds: 10),
      ).register(() => counter++);

      async.elapse(const Duration(seconds: 43));

      expect(counter, 4);
    });
  });

  test(
      "When unregistering a periodic task, the callback should not be called anymore after the duration",
      () {
    fakeAsync((async) {
      int counter = 0;

      final periodicTask = ZupPeriodicTask(
        duration: const Duration(seconds: 10),
      );

      periodicTask.register(() => counter++);
      async.elapse(const Duration(seconds: 12));

      periodicTask.unregister();
      async.elapse(const Duration(seconds: 54));

      expect(counter, 1);
    });
  });

  test(
      "When unregistering a periodic task, then registering another one, the previous one should be canceled and the new callback should be called",
      () {
    fakeAsync((async) {
      int counter = 0;
      const expectedCounter = 83;

      final periodicTask = ZupPeriodicTask(
        duration: const Duration(seconds: 10),
      );

      periodicTask.register(() => counter++);
      async.elapse(const Duration(seconds: 54));

      assert(counter == 5);

      periodicTask.unregister();
      periodicTask.register(() => counter = expectedCounter);
      async.elapse(const Duration(seconds: 12));

      expect(counter, expectedCounter);
    });
  });

  test(
      "When calling forceRun, it should call the registered callback immediately",
      () {
    fakeAsync((async) {
      int counter = 0;

      final periodicTask = ZupPeriodicTask(
        duration: const Duration(seconds: 10),
      );

      periodicTask.register(() => counter++);

      periodicTask.forceRun();
      periodicTask.forceRun();
      periodicTask.forceRun();

      expect(counter, 3);
    });
  });
}
