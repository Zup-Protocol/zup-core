extension GenericObjectExtension<T extends Object> on T? {
  /// Compares two objects of the same type, and returns whether they are equal or not.
  ///
  /// It compare the hashcode, or the objects themselves if they are the same.
  bool equals(T other) {
    if (this == null) return false;

    assert(
      runtimeType == other.runtimeType,
      "Cannot compare objects of different types; Maybe it was a mistake? Types: $runtimeType != $other.runtimeType",
    );

    return hashCode == other.hashCode || this == other;
  }
}
