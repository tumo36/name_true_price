import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:name_true_price/pages/my_home_pages.dart';

void main() {
  group('Home page test', () {
    Finder checkButton() => find.text('Check');
    Finder nextButton() => find.text('Next');
    Finder priceInput() => find.byKey(const Key('priceInput'));

    testWidgets(
      'Change product name after each click',
      (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: HomePage(),
        ));

        expect(find.text(products[0].name), findsOneWidget);
        for (var i = 1; i < 5; i++) {
          await tester.tap(checkButton());
          await tester.pump();
          expect(find.text(products[i].name), findsOneWidget);
        }

        await tester.tap(checkButton());
        await tester.pump();

        expect(find.text(products[4].name), findsOneWidget);
      },
    );
    testWidgets('Check result & show next product',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),
      ));
      expect(nextButton(), findsNothing);
      expect(find.byKey(const Key('result')), findsNothing);
      await tester.enterText(priceInput(), '3');
      await tester.tap(checkButton());
      await tester.pump();
      expect(nextButton(), findsOneWidget);
      expect(find.byKey(const Key('result')), findsOneWidget);
      expect(find.text('pass'), findsOneWidget);

      await tester.tap(nextButton());
      await tester.pump();

      expect(nextButton(), findsNothing);
      expect(find.byKey(const Key('result')), findsNothing);
      await tester.enterText(priceInput(), '4');
      await tester.tap(checkButton());
      await tester.pump();
      expect(nextButton(), findsOneWidget);
      expect(find.byKey(const Key('result')), findsOneWidget);
      expect(find.text('fail'), findsOneWidget);

      await tester.enterText(priceInput(), '5');
      await tester.tap(checkButton());
      await tester.pump();
      expect(find.text('pass'), findsOneWidget);
    });
  });
}
