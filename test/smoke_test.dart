import 'package:flutter_test/flutter_test.dart';

import 'package:name_true_price/main.dart';

void main() {
  testWidgets('smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
  });
}
