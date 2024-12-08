import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zup_core/extensions/generic_object_extension.dart';

/// Methods and variables with information about the device that
/// an application is running on
mixin DeviceInfoMixin {
  /// Return whether the screen size of the running application is mobile or not.
  ///
  /// Note that it considers a width less than 600px to be a mobile, if it's a
  /// mobile, but with a screen width more than 600px it will return false.
  ///
  /// In the same way that if it's running in a tablet, but with a screen width
  /// less than 600px it will return it as true, as the size is considered mobile.
  ///
  /// See also [isTabletSize] and [isDesktopSize]
  bool isMobileSize(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 600;

  /// Return whether the screen size of the running application is tablet or not.
  ///
  /// Note that it considers a width less than 1200px to be a tablet, if it's a
  /// tablet, but with a screen width more than 1200px it will return false.
  ///
  /// In the same way that if it's running in a desktop, but with a screen width
  /// less than 1200px it will return it as true, as the size is considered tablet.
  ///
  /// See also [isDesktopSize] and [isMobileSize]
  bool isTabletSize(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 1200;

  /// Return whether the screen size of the running application is desktop or not.
  ///
  /// Note that it considers a minimum width of 1200px to be a desktop, if it's a
  /// desktop, but with a screen width less than 1200px it will return false.
  ///
  /// See also [isTabletSize] and [isMobileSize]
  bool isDesktopSize(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1200;

  /// Return whether if the application is running on a mobile device or not.
  bool get isMobileDevice =>
      defaultTargetPlatform.equals(TargetPlatform.android) ||
      defaultTargetPlatform.equals(TargetPlatform.iOS);
}
