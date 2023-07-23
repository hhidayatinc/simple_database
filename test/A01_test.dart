import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simple_database/main.dart';

void main() {
  testWidgets('AppBar has title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
      expect(find.widgetWithText(AppBar, "Simple Database SQLite"),
          findsOneWidget, reason: 'Title AppBar Not match');
  });

  testWidgets('Teks Hello found', (WidgetTester tester) async{
    await tester.pumpWidget(const MyApp());
      expect(find.text('Hello'), findsOneWidget, reason: 'Text Hello not found');
  });
}