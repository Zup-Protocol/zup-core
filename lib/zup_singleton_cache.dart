import 'package:clock/clock.dart';
import 'package:zup_core/zup_holder.dart';

class _ZupSingletonCacherEntry<T> {
  _ZupSingletonCacherEntry(this.value, this.time);

  final T value;
  final DateTime time;
}

class ZupSingletonCache {
  ZupSingletonCache._(this._holder);

  /// access the singleton instance of [ZupSingletonCache]
  static final shared = ZupSingletonCache._(ZupHolder());

  final ZupHolder _holder;
  final Map<String, _ZupSingletonCacherEntry> _cache = {};

  /// Executes an operation whose return value will be cached in memory for the duration of the app's runtime.
  /// If a value is already cached for the given key, this function returns the cached value without executing
  /// the provided operation again.
  ///
  /// - Parameters:
  ///   - action: The operation to execute if the value is not cached.
  ///   - key: The key used to store and retrieve the cached value.
  ///   - expiration: (Optional) A duration after which the cached value becomes invalid and the operation
  ///     will be executed again.
  ///   - ignoreCache: (Optional) A boolean indicating whether to bypass the cache and always execute the
  ///     operation, even if a cached value is available.
  ///
  /// Note: This cache exists only in the app's memory during its runtime and does not persist in local storage.
  Future<T> run<T>(
    Future<T> Function() action, {
    required String key,
    Duration? expiration,
    bool ignoreCache = false,
  }) async {
    Future<T> execution() async {
      final result = await action();

      _cache[key] = _ZupSingletonCacherEntry(result, clock.now().toUtc());

      return result;
    }

    if (ignoreCache) return await execution();

    final cachedValue = _cache[key];

    if (cachedValue == null) return await execution();

    if (expiration != null &&
        cachedValue.time.isBefore(
          clock.now().toUtc().subtract(expiration),
        )) {
      return await execution();
    }

    return cachedValue.value;
  }

  /// Clears all stored cache entries.
  ///
  /// Call this method to remove all cached values, allowing subsequent actions
  /// to execute without relying on previously stored results. This can be useful
  /// for refreshing data
  Future<void> clear() async {
    _cache.clear();
  }
}
