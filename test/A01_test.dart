import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simple_database/main.dart';

void main() {
  testWidgets('AppBar has title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    try {
      expect(find.widgetWithText(AppBar, "Simple Database SQLite"),
          findsOneWidget);
      print("Test Success");
    } catch(error){
      print("Test Fail. Text AppBar not match");
      print("The correct titile ");
    }
  });

  testWidgets('Teks Hello found', (WidgetTester tester) async{
    await tester.pumpWidget(const MyApp());
    try {
      expect(find.text('Hello'), findsOneWidget);
      print("Test Success");
    } catch(error){
      print("Test Fail. Text Hello not found");
    }
  });
}