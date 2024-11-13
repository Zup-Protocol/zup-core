import 'package:flutter/material.dart';

/// Enum to choose which side to clip half of a widget using [ZupHalfClipper]
enum ZupHalfClipperSide {
  left,
  right;

  /// Return whether if the [ZupHalfClipperSide] is [ZupHalfClipperSide.left]
  bool get isLeft => this == ZupHalfClipperSide.left;

  /// Return whether if the [ZupHalfClipperSide] is [ZupHalfClipperSide.right]
  bool get isRight => this == ZupHalfClipperSide.right;
}

class ZupHalfClipper extends CustomClipper<Path> {
  /// Instanciate a custom clipper to cut half of any widget.
  ZupHalfClipper({required this.side});

  /// choose which side to clip half of it.
  ///
  /// if [ZupHalfClipperSide.left] is passed, the left half of the widget will be cut.
  /// If [ZupHalfClipperSide.right] is passed, the right half of the widget will be cut.
  ZupHalfClipperSide side;

  @override
  getClip(Size size) {
    final path = Path();
    if (side.isRight)
      return path..addRect(Rect.fromLTRB(0, 0, size.width / 2, size.height));
    return path
      ..addRect(Rect.fromLTRB(size.width / 2, 0, size.width, size.height));
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
