import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:zup_core/zup_core.dart';

import '../golden_config.dart';

void main() {
  Future<DeviceBuilder> goldenBuilder({
    Offset adjustOffsetBy = const Offset(0.0, 0.0),
    RelativePosition position = RelativePosition.onTop,
  }) async =>
      await goldenDeviceBuilder(
        Center(
          child: Container(
            width: 150,
            height: 60,
            color: Colors.red,
            child: Builder(
              builder: (context) => TextButton(
                child: const Text("Show menu"),
                onPressed: () {
                  showMenu(
                    context: context,
                    position: context.relativeRect(
                      relativePosition: position,
                      adjustOffsetBy: adjustOffsetBy,
                    ),
                    items: [
                      const PopupMenuItem(
                        value: "dale",
                        child: Text("Menu item"),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );

  zGoldenTest(
    "When using `relativeRect` with `showMenu` its default position should be on top of the parent widget",
    goldenFileName: "zup_show_menu_default",
    (tester) async {
      await tester.pumpDeviceBuilder(await goldenBuilder());

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();
    },
  );

  zGoldenTest(
    "When using `relativeRect` with `showMenu` and passing a relative position of below, its position should be below the parent widget",
    goldenFileName: "zup_show_menu_below",
    (tester) async {
      await tester.pumpDeviceBuilder(
        await goldenBuilder(position: RelativePosition.below),
      );

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();
    },
  );

  zGoldenTest(
    "When using `relativeRect` with `showMenu` and passing a relative position of above, its position should be above the parent widget",
    goldenFileName: "zup_show_menu_above",
    (tester) async {
      await tester.pumpDeviceBuilder(
        await goldenBuilder(position: RelativePosition.above),
      );

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();
    },
  );

  zGoldenTest(
    "When using `relativeRect` with `showMenu` and passing a relative position of onTop, its position should be on top of the parent widget",
    goldenFileName: "zup_show_menu_onTop",
    (tester) async {
      await tester.pumpDeviceBuilder(
        await goldenBuilder(position: RelativePosition.onTop),
      );

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();
    },
  );

  zGoldenTest(
    "When using `relativeRect` with `showMenu` and adjusting the offset, its position should change accordingly",
    goldenFileName: "zup_show_menu_offset_adjusted",
    (tester) async {
      await tester.pumpDeviceBuilder(
        await goldenBuilder(adjustOffsetBy: const Offset(50, 50)),
      );

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();
    },
  );
}
