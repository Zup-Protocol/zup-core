class ZupHolder {
  /// Create an instance of [ZupHolder] which can be used to hold operations
  /// while one operation is already in progress.
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
      await Future.delayed(const Duration(milliseconds: 100));
    }

    _isHolding = true;

    final result = await action();

    _isHolding = false;

    return result;
  }
}
