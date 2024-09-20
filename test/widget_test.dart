import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_2/main.dart';

void main() {
  testWidgets('Verify Get Started button navigation',
      (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the "Get Started" button is present.
    expect(find.text('Get Started'), findsOneWidget);

    // Tap the "Get Started" button.
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // Verify that the login page is displayed after tapping the button.
    expect(find.text('Login'), findsOneWidget);
  });
}
