/// Relative position based on another widget bounds
enum RelativePosition {
  /// [onTop] means that the relative position is exactly at the top of the widget, like a stack
  onTop,

  /// [above] means that the relative position is above the widget, like a widget before other in a column
  above,

  /// [below] means that the relative position is below the widget, like a widget after other in a column
  below;

  /// get the relative vertical position value based on the widget height, so you can calculate where
  /// to place a new widget based on the relative position type
  double getVerticalPosition(double height) {
    switch (this) {
      case RelativePosition.onTop:
        return 0;
      case RelativePosition.above:
        return -height;
      case RelativePosition.below:
        return height;
    }
  }
}
