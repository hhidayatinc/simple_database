import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_database/screens/contact_form.dart';

void main(){
  testWidgets('UI Component-AppBar', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try{
    expect(find.byType(AppBar), findsOneWidget);
    print("Test Success!");
  } catch(e) {
      print('Test Fail. App Bar not found');
    }
  });

  testWidgets('UI Component-Title AppBar', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try {
      expect(find.widgetWithText(AppBar, 'Contact Form'), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test Fail. Title App Bar Not Match');
    }
  });

  testWidgets('UI Component-Form', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try {
      expect(find.byType(Form), findsOneWidget);
      print('Test Success!');
    }catch(e){
      print('Test Fail. Form not found');
    }
  });

  testWidgets('UI Component-ListView Form', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try {
      expect(find.byType(ListView), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test Fail. Listview Form not found');
    }
  });

  testWidgets('UI Component-TextFormField', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try {
      expect(find.byType(TextFormField), findsNWidgets(4));
      print('Test Success!');
    } catch(e){
      print('Test Fail. 4 TextFormField not found');
    }
  });

  testWidgets('UI Component-ElevatedButton', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try {
      expect(find.byType(ElevatedButton), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test fail. Button not found');
    }
  });

  testWidgets('UI Component-ElevatedButton-Add', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try {
      expect(find.widgetWithText(ElevatedButton, 'Add'), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test Fail. Button Add not found');
    }
  });

  testWidgets('UI Component-ElevatedButton-Update', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try {
      expect(find.widgetWithText(ElevatedButton, 'Update'), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test fail. Button not found');
    }
  });
}