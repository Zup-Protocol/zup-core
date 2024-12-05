import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:golden_toolkit/golden_toolkit.dart";

class GoldenConfig {
  static final pcDevice = [const Device(size: Size(1912, 1040), name: "pc")];
  static final smallSquareDevice = [
    const Device(size: Size(800, 800), name: "square")
  ];

  static final scrollController = ScrollController();

  static Future<Widget> builder(Widget child) async {
    await loadAppFonts();

    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.white, body: child),
    );
  }
}

Future<DeviceBuilder> goldenDeviceBuilder(
  Widget child, {
  bool largeDevice = false,
}) async =>
    DeviceBuilder()
      ..overrideDevicesForAllScenarios(
          devices: largeDevice
              ? GoldenConfig.pcDevice
              : GoldenConfig.smallSquareDevice)
      ..addScenario(widget: await GoldenConfig.builder(child));

@isTest
void zGoldenTest(
  String description,
  Future<void> Function(WidgetTester tester) test, {
  String? goldenFileName,
}) {
  return testGoldens(description, (tester) async {
    await test(tester);
    await tester.pumpAndSettle();

    if (goldenFileName != null) {
      try {
        await screenMatchesGolden(tester, goldenFileName);
      } catch (e) {
        if ((e as TestFailure).message!.contains("non-existent file")) {
          autoUpdateGoldenFiles = true;
          await screenMatchesGolden(tester, goldenFileName);
          autoUpdateGoldenFiles = false;

          debugPrint(
              "Golden file not detected. Auto-generated golden file: $goldenFileName");

          return;
        }

        rethrow;
      }
    }
  });
}
