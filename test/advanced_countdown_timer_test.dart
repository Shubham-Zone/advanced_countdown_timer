import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:advanced_countdown_timer/advanced_countdown_timer.dart';

void main() {
  testWidgets('AdvancedCountdownTimer displays correct initial time and starts countdown', (WidgetTester tester) async {
    // Define the countdown duration (e.g., 10 seconds)
    const duration = Duration(seconds: 10);

    // Build the AdvancedCountdownTimer widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AdvancedCountdownTimer(
            duration: duration,
          ),
        ),
      ),
    );

    // Verify that the initial time is displayed correctly
    expect(find.text('0:10'), findsOneWidget);

    // Start the countdown
    await tester.tap(find.text('Start'));
    await tester.pump();

    // Fast forward time by 1 second
    await tester.pump(const Duration(seconds: 1));

    // Verify that the time has decreased by 1 second
    expect(find.text('0:09'), findsOneWidget);
  });

  testWidgets('AdvancedCountdownTimer pauses and resets correctly', (WidgetTester tester) async {
    const duration = Duration(seconds: 10);

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AdvancedCountdownTimer(
            duration: duration,
          ),
        ),
      ),
    );

    // Start the countdown
    await tester.tap(find.text('Start'));
    await tester.pump();

    // Fast forward by 2 seconds
    await tester.pump(const Duration(seconds: 2));

    // Pause the countdown
    await tester.tap(find.text('Pause'));
    await tester.pump();

    // Verify that the time is paused
    expect(find.text('0:08'), findsOneWidget);

    // Fast forward 2 more seconds (should not change since it's paused)
    await tester.pump(const Duration(seconds: 2));
    expect(find.text('0:08'), findsOneWidget);

    // Reset the countdown
    await tester.tap(find.text('Reset'));
    await tester.pump();

    // Verify that the time has reset back to the original duration
    expect(find.text('0:10'), findsOneWidget);
  });
}
