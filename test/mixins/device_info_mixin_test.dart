import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/mixins/device_info_mixin.dart';

class _DeviceInfoMixinTestWrapper with DeviceInfoMixin {}

void main() {
  late _DeviceInfoMixinTestWrapper sut;

  setUp(() {
    sut = _DeviceInfoMixinTestWrapper();
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets(
      "`isMobileSize` should return true if the screen width is less than 600px",
      (tester) async {
    BuildContext? testContext;

    await tester.pumpWidget(Builder(builder: (context) {
      testContext = context;
      return Container();
    }));

    tester.platformDispatcher.views.first.devicePixelRatio = 1.0;
    tester.platformDispatcher.views.first.physicalSize = const Size(500, 500);

    await tester.pumpAndSettle();
    expect(sut.isMobileSize(testContext!), true);
  });

  testWidgets(
      "`isMobileSize` should return false if the screen width is more than 600px",
      (tester) async {
    BuildContext? testContext;

    await tester.pumpWidget(Builder(builder: (context) {
      testContext = context;
      return Container();
    }));

    tester.platformDispatcher.views.first.devicePixelRatio = 1.0;
    tester.platformDispatcher.views.first.physicalSize = const Size(650, 650);

    await tester.pumpAndSettle();
    expect(sut.isMobileSize(testContext!), false);
  });

  testWidgets(
      "`isTabletSize` should return false if the screen width is more than 1200px",
      (tester) async {
    BuildContext? testContext;

    await tester.pumpWidget(Builder(builder: (context) {
      testContext = context;
      return Container();
    }));

    tester.platformDispatcher.views.first.devicePixelRatio = 1.0;
    tester.platformDispatcher.views.first.physicalSize = const Size(1400, 1400);

    await tester.pumpAndSettle();
    expect(sut.isTabletSize(testContext!), false);
  });

  testWidgets(
      "`isTabletSize` should return true if the screen width is less than 1200px",
      (tester) async {
    BuildContext? testContext;

    await tester.pumpWidget(Builder(builder: (context) {
      testContext = context;
      return Container();
    }));

    tester.platformDispatcher.views.first.devicePixelRatio = 1.0;
    tester.platformDispatcher.views.first.physicalSize = const Size(1100, 1100);

    await tester.pumpAndSettle();
    expect(sut.isTabletSize(testContext!), true);
  });

  testWidgets(
      "`isDesktopSize` should return true if the screen width is more than 1200px",
      (tester) async {
    BuildContext? testContext;

    await tester.pumpWidget(Builder(builder: (context) {
      testContext = context;
      return Container();
    }));

    tester.platformDispatcher.views.first.devicePixelRatio = 1.0;
    tester.platformDispatcher.views.first.physicalSize = const Size(1300, 1300);

    await tester.pumpAndSettle();
    expect(sut.isDesktopSize(testContext!), true);
  });

  testWidgets(
      "`isTabletSize` should return false if the screen width is less than 1200px",
      (tester) async {
    BuildContext? testContext;

    await tester.pumpWidget(Builder(builder: (context) {
      testContext = context;
      return Container();
    }));

    tester.platformDispatcher.views.first.devicePixelRatio = 1.0;
    tester.platformDispatcher.views.first.physicalSize = const Size(1100, 1100);

    await tester.pumpAndSettle();
    expect(sut.isDesktopSize(testContext!), false);
  });

  test("`isMobile` should return true if the defaultTargetPlatform is android",
      () {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;

    expect(sut.isMobileDevice, true);
  });

  test("`isMobile` should return true if the defaultTargetPlatform is ios", () {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

    expect(sut.isMobileDevice, true);
  });

  test(
      "`isMobile` should return false if the defaultTargetPlatform is not mobile",
      () {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    expect(sut.isMobileDevice, false, reason: 'macOS is not a mobile platform');

    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    expect(sut.isMobileDevice, false, reason: 'Linux is not a mobile platform');

    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    expect(
      sut.isMobileDevice,
      false,
      reason: 'Windows is not a mobile platform',
    );

    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
    expect(
      sut.isMobileDevice,
      false,
      reason: 'Fuchsia is not a mobile platform',
    );
  });
}
