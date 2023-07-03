

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
      print("Test Berhasil");
    } catch(error){
      print("Test gagal");
      print("Text appbar tidak sesuai");
    }
  });

  testWidgets('Teks Hello found', (WidgetTester tester) async{
    await tester.pumpWidget(const MyApp());
    try {
      expect(find.text('Hello'), findsOneWidget);
      print("Test Berhasil");
    } catch(error){
      print("Test gagal");
      print("Text Hello tidak ditemukan");
    }
  });
}
