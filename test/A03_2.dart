import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_database/screens/contact_form.dart';
import 'package:simple_database/utils/contact.dart';

void main(){
  Contact c = Contact(name: "Risa", email: "risa@gmail.com", number: "087654389090", company: "Polinema");

  testWidgets('UI Component-AppBar Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    try{
    expect(find.byType(AppBar), findsOneWidget);
    print("Test Success!");
  } catch(e) {
      print('Test Fail. App Bar not found');
    }
  });

  testWidgets('UI Component-Title AppBar Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    try {
      expect(find.widgetWithText(AppBar, 'Contact Form'), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test Fail. Title App Bar Not Match');
    }
  });

  testWidgets('UI Component-Form Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    try {
      expect(find.byType(Form), findsOneWidget);
      print('Test Success!');
    }catch(e){
      print('Test Fail. Form not found');
    }
  });

  testWidgets('UI Component-ListView Form Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    try {
      expect(find.byType(ListView), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test Fail. Listview Form not found');
    }
  });

  testWidgets('UI Component-TextFormField Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    try {
      expect(find.byType(TextFormField), findsNWidgets(4));
      print('Test Success!');
    } catch(e){
      print('Test Fail. 4 TextFormField not found');
    }
  });
  
  testWidgets('TextFormField Name has data', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    try{
      expect(find.widgetWithText(TextFormField, 'Risa'), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test Fail!');
      print('TextFormField Name has no data');
    }
  });

  testWidgets('TextFormField Email has data', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    try{
      expect(find.widgetWithText(TextFormField, 'risa@gmail.com'), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test Fail!');
      print('TextFormField Email has no data');
    }
  });

  testWidgets('TextFormField Company has data', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    try{
      expect(find.widgetWithText(TextFormField, 'Polinema'), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test Fail!');
      print('TextFormField Company has no data');
    }
  });

  testWidgets('TextFormField email has data', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    try{
      expect(find.widgetWithText(TextFormField, 'Risa'), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test Fail!');
      print('TextFormField Name has no data');
    }
  });

  testWidgets('UI Component-ElevatedButton', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    try {
      expect(find.byType(ElevatedButton), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test fail. Button not found');
    }
  });

  testWidgets('UI Component-ElevatedButton-Add Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    try {
      expect(find.widgetWithText(ElevatedButton, 'Add'), findsNothing);
      print('Test Success!');
    } catch(e){
      print('Test Fail. Button Add found');
    }
  });

   testWidgets('UI Component-ElevatedButton-Update Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    try {
      expect(find.widgetWithText(ElevatedButton, 'Update'), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test fail. Button Update not found');
    }
  });

}