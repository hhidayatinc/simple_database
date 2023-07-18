import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_database/screens/contact_form.dart';

void main(){
  testWidgets('UI Component-AppBar Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try{
    expect(find.byType(AppBar), findsOneWidget);
    print("Test Success!");
  } catch(e) {
      print('Test Fail. App Bar not found');
      print("Please check your code in ContactForm class after widget Scaffold.");
    }
  });

  testWidgets('UI Component-Title AppBar Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try {
      expect(find.widgetWithText(AppBar, 'Contact Form'), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test Fail. Title App Bar Not Match');
      print('The correct title for AppBar is Contact Form');
    }
  });

  testWidgets('UI Component-Form Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try {
      expect(find.byType(Form), findsOneWidget);
      print('Test Success!');
    }catch(e){
      print('Test Fail. Form not found');
      print('Parameter widget body is Form. Please review your code and make sure your parameter widget body is right');
    }
  });

  testWidgets('UI Component-ListView Form Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try {
      expect(find.byType(ListView), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test Fail. Listview Form not found');
      print('This ListView is parameter child widget from Form.');
      print('Please review your code and make sure that you provide the correct widget');
    }
  });

  testWidgets('UI Component-TextFormField Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try {
      expect(find.byType(TextFormField), findsNWidgets(4));
      print('Test Success!');
    } catch(e){
      print('Test Fail. 4 TextFormField not found');
      print('Check your code and make sure you have 4 widget TextFormField.');
      print('This widget for insert data name, email, company, and number');
    }
  });

  testWidgets('UI Component-ElevatedButton Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try {
      expect(find.byType(ElevatedButton), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test fail. Button not found');
      print('Please add this button in the end of the last TextFormField and use widget ElevatedButton');
    }
  });

  testWidgets('UI Component-ElevatedButton-Add Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try {
      expect(find.widgetWithText(ElevatedButton, 'Add'), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test Fail. Button Add not found');
      print('Make sure the value in Text widget is Add');
    }
  });

  testWidgets('UI Component-ElevatedButton-Update Not Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    try {
      expect(find.widgetWithText(ElevatedButton, 'Update'), findsNothing);
      print('Test Success!');
    } catch(e){
      print('Test fail. Button Update found');
      print('This button should not appear yet because the form is not for editing contact data');
    }
  });
}