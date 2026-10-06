import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navigation/main.dart';

void main() {
  testWidgets('bottom navigation displays content for each section', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BookNookApp());

    expect(find.text('Good morning, Alex'), findsOneWidget);
    expect(find.text('The Midnight Library'), findsOneWidget);

    await tester.tap(find.text('Browse'));
    await tester.pumpAndSettle();
    expect(find.text('Find your next read'), findsOneWidget);
    expect(find.text('The Alchemist'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Educated');
    await tester.pumpAndSettle();
    expect(find.text('Educated'), findsNWidgets(2));
    expect(find.text('The Alchemist'), findsNothing);

    await tester.tap(find.text('Saved'));
    await tester.pumpAndSettle();
    expect(find.text('Your saved shelf'), findsOneWidget);
    expect(find.text('Saved for later'), findsOneWidget);

    await tester.tap(find.text('Inbox'));
    await tester.pumpAndSettle();
    expect(find.text('Your inbox'), findsOneWidget);
    expect(find.text('Your weekly reading note'), findsOneWidget);

    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();
    expect(find.text('Your profile'), findsOneWidget);
    expect(find.text('Alex Morgan'), findsOneWidget);
  });
}
