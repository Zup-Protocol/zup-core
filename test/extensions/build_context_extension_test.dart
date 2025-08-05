import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/zup_core.dart';

void main() {
  testWidgets(
    "When calling '.brightness' in the context and the brightness is light, it should return the light brightness",
    (tester) async {
      BuildContext? context0;

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Builder(
            builder: (context) {
              context0 = context;
              return const SizedBox();
            },
          ),
        ),
      );
      expect(context0!.brightness, Brightness.light);
    },
  );

  testWidgets(
    "When calling '.brightness' in the context, and the brightness is dark, it should return the dark brightness",
    (tester) async {
      BuildContext? context0;

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Builder(
            builder: (context) {
              context0 = context;
              return const SizedBox();
            },
          ),
        ),
      );
      expect(context0!.brightness, Brightness.dark);
    },
  );
}
