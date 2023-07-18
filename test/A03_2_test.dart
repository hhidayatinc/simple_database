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
      print("Please check your code in ContactForm class after widget Scaffold.");
    }
  });

  testWidgets('UI Component-Title AppBar Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    try {
      expect(find.widgetWithText(AppBar, 'Contact Form'), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test Fail. Title App Bar Not Match');
      print('The correct title for AppBar is Contact Form');

    }
  });

  testWidgets('UI Component-Form Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    try {
      expect(find.byType(Form), findsOneWidget);
      print('Test Success!');
    }catch(e){
      print('Test Fail. Form not found');
      print('Parameter widget body is Form. Please review your code and make sure your parameter widget body is right');
    }
  });

  testWidgets('UI Component-ListView Form Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
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
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    try {
      expect(find.byType(TextFormField), findsNWidgets(4));
      print('Test Success!');
    } catch(e){
      print('Test Fail. 4 TextFormField not found');
      print('Check your code and make sure you have 4 widget TextFormField.');
      print('This widget for insert data name, email, company, and number');
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
      print('Make sure you have added the widget.contact.name variable to the ContactForm class');
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
      print('Make sure you have added the widget.contact.email variable to the ContactForm class');
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
      print('Make sure you have added the widget.contact.company variable to the ContactForm class');
    }
  });

  testWidgets('TextFormField number phone has data', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    try{
      expect(find.widgetWithText(TextFormField, 'Risa'), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test Fail!');
      print('TextFormField Name has no data');
      print('Make sure you have added the widget.contact.number variable to the ContactForm class');
    }
  });

  testWidgets('UI Component-ElevatedButton', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    try {
      expect(find.byType(ElevatedButton), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test fail. Button not found');
      print('Please add this button in the end of the last TextFormField and use widget ElevatedButton');
    }
  });

  testWidgets('UI Component-ElevatedButton-Update Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    try {
      expect(find.widgetWithText(ElevatedButton, 'Update'), findsOneWidget);
      print('Test Success!');
    } catch(e){
      print('Test fail. Button Update not found');
      print('Make sure the value in Text widget is Update');
    }
  });


  testWidgets('UI Component-ElevatedButton-Add Not Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    try {
      expect(find.widgetWithText(ElevatedButton, 'Add'), findsNothing);
      print('Test Success!');
    } catch(e){
      print('Test Fail. Button Add found');
      print('This button should not appear yet because the form is not for adding contact data');
    }
  });

   
}