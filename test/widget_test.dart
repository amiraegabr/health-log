import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthlog/main.dart';

void main() {
  testWidgets('Incrementing the counter correctly updates the UI', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that the initial counter value is 0 and that the increment button is enabled.
    expect(find.text('0'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byIcon(Icons.add).hasEnabled(), isTrue);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the counter has incremented and that the decrement button is enabled.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
    expect(find.byIcon(Icons.remove), findsOneWidget);
    expect(find.byIcon(Icons.remove).hasEnabled(), isTrue);

    // Tap the '-' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that the counter has decremented and that the increment button is enabled.
    expect(find.text('1'), findsNothing);
    expect(find.text('0'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byIcon(Icons.add).hasEnabled(), isTrue);
  });
}
