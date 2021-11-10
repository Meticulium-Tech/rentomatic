import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rentomatic/utils/utils.dart';
import 'package:rentomatic/widgets/widgets.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ActionButton(
        color: Palette.secondary, callback: () {}, label: "Widgets test"));
    await tester.tap(find.byWidget(GestureDetector()));
    await tester.pump();
    expect(find.text('0'), findsNothing);
  });
}
