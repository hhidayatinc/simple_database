import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_database/screens/contact_form.dart';
import 'package:simple_database/utils/contact.dart';

void main(){
  Contact c = Contact(name: "Risa", email: "risa@gmail.com", number: "087654389090", company: "Polinema");

  void checkNWidget(Finder finder, int n, String reason) {
    expect(finder, findsNWidgets(n), reason: reason);
  }

  void checkOneWidget(Finder finder, String reason){
    expect(finder, findsOneWidget, reason: reason);
  }

  void checkNothing(Finder finder, String reason){
    expect(finder, findsNothing, reason: reason);
  }

  testWidgets('UI Component-AppBar Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    Finder findAppBar = find.byType(AppBar);
    checkOneWidget(findAppBar, "Widget AppBar not found. Please review Guide A03");
  });

  testWidgets('UI Component-Title AppBar Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    String titleAppBar = 'Contact Form';
    Finder findTitleAppBar = find.widgetWithText(AppBar, titleAppBar);
    checkOneWidget(findTitleAppBar, 'The correct title for Appbar is $titleAppBar');
  });

  testWidgets('UI Component-Form Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    Finder findFormWidget = find.byType(Form);
    checkOneWidget(findFormWidget, 'Add Form widget for body parameter in class. Review your Guide A03');
  });

  testWidgets('UI Component-ListView Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    Finder findListViewWidget = find.byType(ListView);
     checkOneWidget(findListViewWidget, 'Add ListView for child widget in Form. Look at your Guide A03 for the correct structure widget');
  });

  testWidgets('UI Component-4 TextFormField Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    Finder findTextFormField = find.byType(TextFormField);
    int count = 4;
    checkNWidget(findTextFormField, count, 
    'Your widgets TextFormField count is incomplete. Please complete up to $count');
  });
  
  testWidgets('TextFormField Name has data', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    String name = c.name.toString();
    Finder findWidgetTextName = find.widgetWithText(TextFormField, name);
    checkOneWidget(findWidgetTextName, 'TextFormField Name has data');
  });

  testWidgets('TextFormField Email has data', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    String email = c.email.toString();
    Finder findWidgetTextEmail = find.widgetWithText(TextFormField, email);
    checkOneWidget(findWidgetTextEmail, 'TextFormField Email has data');
  });

  testWidgets('TextFormField Company has data', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    String company = c.name.toString();
    Finder findWidgetTextCompany = find.widgetWithText(TextFormField, company);
    checkOneWidget(findWidgetTextCompany, 'TextFormField Company has data');
  });

  testWidgets('TextFormField number phone has data', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    String company = c.company.toString();
    Finder findWidgetTextCompany = find.widgetWithText(TextFormField, company);
    checkOneWidget(findWidgetTextCompany, 'TextFormField Company has data');
  });

  testWidgets('UI Component-ElevatedButton', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    Finder findElevatedButton = find.byType(ElevatedButton);
    checkOneWidget(findElevatedButton, 'Add ElevatedButton at the end of 4 TextFormField');
  });

  testWidgets('UI Component-ElevatedButton-Update Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    String update = 'Update';
    Finder findTextUpdate = find.widgetWithText(ElevatedButton, update);
    checkOneWidget(findTextUpdate, 'Update Button required. Review your code and Guide A03');
  });

  testWidgets('UI Component-ElevatedButton-Add Not Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    String add = 'Add';
    Finder findTextAdd = find.widgetWithText(ElevatedButton, add);
    checkNothing(findTextAdd, 'This button should not exist');
  });
}