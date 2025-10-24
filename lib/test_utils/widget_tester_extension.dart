part of '../test_utils.dart';

extension WidgetTesterExtension on WidgetTester {
  /// Simulates a mouse hovering the passed [find] (or widget) on the screen.
  ///
  /// Useful for testing hover states
  Future<TestGesture> hover(Finder find) async {
    final gesture = await createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);

    await gesture.moveTo(getCenter(find));

    return gesture;
  }

  /// Simulates a mouse moving from one point, to another, like if a mouse
  /// was hovering something and then move to another place.
  ///
  /// [to]: Offset to move the hover by
  ///
  /// [hoverGesture]: The hover gesture used to hover something before.
  /// In case you don't have it, using the function [hover] will return
  /// it by default.
  Future<void> moveHoverByOffset(Offset to, TestGesture hoverGesture) async {
    await hoverGesture.moveBy(to);
  }

  /// Simulates a mouse moving from one widget to another.
  ///
  /// [find] the finder object of the new widget to move the mouse to.
  ///
  /// [hoverGesture]: The hover gesture used to hover something before.
  /// In case you don't have it, using the function [hover] will return
  /// it by default.
  ///
  /// This function is useful when you want to test the hover state of a widget
  /// after the user hover another widget
  Future<void> moveHoverToWidget(Finder find, TestGesture hoverGesture) async {
    await hoverGesture.moveTo(getCenter(find));
  }

  /// Removes the hover state from a passed hover gesture
  ///
  /// Useful for removing the hover when testing multiple widgets or states of one widget
  ///
  /// Note that first you should call [hover] to after [unHover] it.
  Future<void> unHover(TestGesture hoverGesture) async {
    await hoverGesture.down(Offset.zero);
    await hoverGesture.cancel();
  }
}
