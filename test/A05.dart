

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simple_database/main.dart';
import 'package:simple_database/screens/contact_list.dart';

void main() {

  testWidgets('AppBar has title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    try {
      expect(find.text("Simple Database SQLite"),
          findsOneWidget);
      print("Test Success!");
    } catch(error){
      print("Test fail. Text title in AppBar not found");
    }
  });
  testWidgets('Pump to another class', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    try {
      expect(find.text('ContactList'), findsOneWidget);
      print("Test Suuccess!");
    } catch(error){
      print("Test Fail.");
    }
  });
}
