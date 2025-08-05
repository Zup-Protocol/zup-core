import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:zup_core/zup_core.dart';

import '../golden_config.dart';

void main() {
  Future<DeviceBuilder> deviceBuilder(Color color) async =>
      await goldenDeviceBuilder(
        Center(child: Container(height: 40, width: 40, color: color)),
      );

  zGoldenTest(
    "When calling 'lighter' and passing '1' it should make the color passed totally white",
    goldenFileName: "color_lighter_1",
    (tester) async {
      await tester.pumpDeviceBuilder(
        await deviceBuilder(Colors.black.lighter(1)),
      );
    },
  );

  zGoldenTest(
    "When calling 'lighter' and passing '0.5' it should make the color half mixed white",
    goldenFileName: "color_lighter_05",
    (tester) async {
      await tester.pumpDeviceBuilder(
        await deviceBuilder(Colors.green.lighter(0.5)),
      );
    },
  );

  zGoldenTest(
    "When calling 'lighter' and passing '0' it should not change the color",
    goldenFileName: "color_lighter_0",
    (tester) async {
      await tester.pumpDeviceBuilder(
        await deviceBuilder(Colors.green.lighter(0)),
      );
    },
  );

  zGoldenTest(
    "When calling 'darker' and passing '1' it should make the color passed totally black",
    goldenFileName: "color_darker_1",
    (tester) async {
      await tester.pumpDeviceBuilder(
        await deviceBuilder(Colors.white.darker(1)),
      );
    },
  );

  zGoldenTest(
    "When calling 'darker' and passing '0.5' it should make the color half mixed black",
    goldenFileName: "color_darker_05",
    (tester) async {
      await tester.pumpDeviceBuilder(
        await deviceBuilder(Colors.green.darker(0.5)),
      );
    },
  );

  zGoldenTest(
    "When calling 'darker' and passing '0' it should not change the color",
    goldenFileName: "color_darker_0",
    (tester) async {
      await tester.pumpDeviceBuilder(
        await deviceBuilder(Colors.green.darker(0)),
      );
    },
  );
}
