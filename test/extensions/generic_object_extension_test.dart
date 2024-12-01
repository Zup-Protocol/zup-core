import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/zup_core.dart';

class _EquatableObject extends Equatable {
  const _EquatableObject(this.param);

  final dynamic param;

  @override
  List<Object?> get props => [param];
}

void main() {
  test(
      "When passing different instances of the same object to `equals` it should return false",
      () {
    final object = Object();
    final object2 = Object();

    expect(object.equals(object2), false);
  });

  test(
      "When passing different object types to `equals` it should assert, as it does not make sense",
      () {
    final object = Object();
    const object2 = Align();

    expect(() => object.equals(object2), throwsAssertionError);
  });

  test(
      "When passing the same instance of the same object to `equals` it should return true",
      () {
    final object = Object();

    expect(object.equals(object), true);
  });

  test(
    "When passing different instances of a object to `equals`, but they are equatable, and have the same props, it should return true",
    () {
      const object = _EquatableObject(1);
      const object2 = _EquatableObject(1);

      expect(object.equals(object2), true);
    },
  );

  test(
    "When passing different instances of a object to `equals`, but they are equatable, and have't the same props, it should return false",
    () {
      const object = _EquatableObject(1);
      const object2 = _EquatableObject(2);

      expect(object.equals(object2), false);
    },
  );
}
