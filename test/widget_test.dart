// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_simple_calculator/main.dart';

void main() {
  testWidgets('Calculator button tap test', (WidgetTester tester) async {
    //Build  app and trigger a frame.
    await tester.pumpWidget(CalculatorApp());

    //Verify that initial display text is '0'.
    expect(find.text('0'), findsOneWidget);

    // ap the '1' button and trigger a frame.
    await tester.tap(find.text('1'));
    await tester.pump();

    //Verify that the display now shows '1'.
    expect(find.textContaining('1'), findsOneWidget);

    //Tap the '+' button and '2' button, then '=' button.
    await tester.tap(find.text('+'));
    await tester.pump();
    await tester.tap(find.text('2'));
    await tester.pump();
    await tester.tap(find.text('='));
    await tester.pump();

    //Verify that the display now shows '3'.
    expect(find.textContaining('3'), findsOneWidget);

    //Tap the 'AC' button and trigger a frame.
    await tester.tap(find.text('AC'));
    await tester.pump();

    //Verify that the display is reset to '0'.
    expect(find.text('0'), findsOneWidget);
  });
}
