import 'dart:async';

import 'package:flutter/foundation.dart';

class ZupPeriodicTask {
  /// Executes a task every time that the [duration] passes.
  ///
  /// Useful for mocking periodic tasks which is not possible with [Timer.periodic]
  ///
  /// **Warning:** This call should not be used as singleton, or shared between multiple tasks, as it is intented
  /// to be task specific, each task should have its own instance. If you need to share it, for some reason,
  /// please call [unregister] before registering a new periodic task with [register]
  ZupPeriodicTask({required this.duration});

  final Duration duration;

  Timer? _timer;
  Function()? _callback;

  void _execute() {
    assert(
      _timer != null && _callback != null,
      'Internal error: timer and callback should be set before _execution is called',
    );

    _callback!();
  }

  /// Start a periodic task that will run every [duration] (which is passed
  /// at the creation of the [ZupPeriodicTask] instance)
  ///
  /// This should be called only once, to register the task and run it.
  /// If you need to restart the task, please call [unregister] first and then call [register] again
  void register(Function() callback) {
    assert(
      _callback == null && _timer == null,
      """Timer already initialized, can't re-run it. If you want to restart the timer, call stop() first.
      If you desire to run another timer, please create a new instance of ZupPeriodicTask""",
    );

    _callback = callback;
    _timer = Timer.periodic(duration, (_) => _execute());
  }

  /// Stop the current periodic task
  ///
  /// It will immediately cancel the task, so it won't run anymore after the [duration] passes
  void unregister() {
    _callback = null;
    _timer?.cancel();
    _timer = null;
  }

  /// Force the periodic task to run even if the [duration] has not passed yet.
  ///
  /// This is a helper function for testing porpuses, useful for testing the callback multiple times
  @visibleForTesting
  void forceRun() => _execute();
}
