part of "../test_utils.dart";

/// Returns a matcher that matches objects of type [T] with a given property
/// matching.
///
/// Useful to test if a property of an object is a expected value or not.
///
/// ```dart
/// expect(shouldBeDuration, matchesProperty((Duration obj) => obj.inSeconds > 0));
/// ```
@visibleForTesting
ObjectParamMatcher<T> matchesProperty<T>(bool Function(T obj) matching) =>
    ObjectParamMatcher<T>(matching);

/// A matcher that matches objects of type [T] for which the given function
/// returns `true`. The function is passed the object to match as its single
/// argument.
@protected
@visibleForTesting
class ObjectParamMatcher<T> extends Matcher {
  ObjectParamMatcher(this.matching);

  final bool Function(T object) matching;

  @override
  Description describeMismatch(
    item,
    Description mismatchDescription,
    Map matchState,
    bool verbose,
  ) {
    return mismatchDescription.add(
      "Object $T does not match with the passed property",
    );
  }

  @override
  Description describe(Description description) => description.add(
    "matches objects of type $T for which the given function returns true",
  );

  @override
  bool matches(item, Map matchState) => matching(item as T);
}
