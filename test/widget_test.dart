// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';

import 'package:breaking_bad_flutter_app/main.dart';

void main() {
  testWidgets('Main page smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our tabBar exists
    expect(find.text('Characters'), findsOneWidget);
    expect(find.text('Episodes'), findsOneWidget);
    expect(find.text('Quotes'), findsOneWidget);
    expect(find.text('Deaths'), findsOneWidget);
  });
}
