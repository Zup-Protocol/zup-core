class ZupHolder {
  /// Holds an operation until the previous one is finished.
  ///
  /// Useful for preventing multiple operations from running at the same time.
  ZupHolder();

  bool _isHolding = false;

  /// Hold until the previous [action] is finished before running [action].
  /// This is useful for preventing multiple operations from running at the same
  /// time.
  ///
  /// [action] is a function that takes no arguments and returns a Future of type
  /// [T].
  ///
  /// The function returned by [hold] will return the same value as [action].
  Future<T> hold<T>(Future<T> Function() action) async {
    while (_isHolding) {
      await Future.delayed(const Duration(microseconds: 1));
    }

    _isHolding = true;
    final result = await action();
    _isHolding = false;

    return result;
  }
}
