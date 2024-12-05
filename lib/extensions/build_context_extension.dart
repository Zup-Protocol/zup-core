import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zup_core/enums/relative_rect_position.dart';

export 'package:zup_core/enums/relative_rect_position.dart';

extension BuildContextExtension on BuildContext {
  /// Get the relative rect in the screen for a given context.
  ///
  /// Useful for displaying a widget (e.g a modal) on top of another widget, or close to it.
  /// Works perfectly with showMenu:
  /// ```dart
  /// showMenu(
  ///   context: context,
  ///   position: context.relativeRect(),
  ///   items: []
  /// );
  /// ```
  ///
  /// `adjustOffsetBy` is used to adjust the position of the returned rect, like a margin or padding.
  /// A usecase can be a menu that will be shown 10px below the button, not exactly at the bottom of the button.
  ///
  /// `relativePosition` is used to choose the position of the returned rect. Like on top, below, above...
  /// Defaults to [RelativePosition.onTop]
  RelativeRect relativeRect({
    Offset adjustOffsetBy = const Offset(0.0, 0.0),
    RelativePosition relativePosition = RelativePosition.onTop,
  }) {
    final RenderBox object = findRenderObject()! as RenderBox;

    final RenderBox overlay =
        Navigator.of(this).overlay!.context.findRenderObject()! as RenderBox;

    Offset offset =
        Offset(0.0, relativePosition.getVerticalPosition(object.size.height)) +
            adjustOffsetBy;

    final RelativeRect relativeRect = RelativeRect.fromRect(
      Rect.fromPoints(
        object.localToGlobal(offset, ancestor: overlay),
        object.localToGlobal(
          object.size.bottomRight(Offset.zero) + offset,
          ancestor: overlay,
        ),
      ),
      Offset.zero & overlay.size,
    );

    return relativeRect;
  }
}
