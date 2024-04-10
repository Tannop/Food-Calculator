import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/main.dart';

void main() {
  group('CalculatorScreen Tests: ', () {
    testWidgets('1 Initial total price without any items ordered',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // Verify that the initial total price is 0 THB
      expect(find.text('Total Price: 0.0 THB'), findsOneWidget);
    });

    testWidgets('2 Total price without member card and no discounts',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // Tap the '+' button for Red item twice
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add).first);
      await tester.pump();
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add).first);
      await tester.pump();

      // Tap the '+' button for Green item once
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add).at(1));
      await tester.pump();

      // Verify the total price calculation without member card and no discounts
      expect(find.text('Total Price: 140.0 THB'), findsOneWidget);
    });

    testWidgets('3 Total price with member card and no discounts',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // Tap the Member Card checkbox
      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      // Tap the '+' button for Yellow item three times
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add).at(3));
      await tester.pump();
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add).at(3));
      await tester.pump();
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add).at(3));
      await tester.pump();

      // Verify the total price calculation with member card and no discounts
      expect(find.text('Total Price: 135.0 THB'), findsOneWidget);
    });
  });
}
