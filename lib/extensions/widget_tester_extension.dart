import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExtension on WidgetTester {
  /// Simulates a mouse hovering the passed [find] (or widget) on the screen.
  ///
  /// Useful for testing hover states
  Future<void> hover(Finder find) async {
    final gesture = await createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);

    await gesture.moveTo(getCenter(find));
  }

  /// Removes the hover state from the passed [find] (or widget) on the screen.
  ///
  /// Useful for removing the hover when testing multiple widgets or states of one widget
  ///
  /// Note that first you should call [hover] to after [unHover] it
  Future<void> unHover(Finder find) async {
    final gesture = await createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);

    gesture.cancel();
  }
}
