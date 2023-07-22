import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_database/screens/contact_form.dart';

void main(){

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
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findAppBar = find.byType(AppBar);
    checkOneWidget(findAppBar, "Widget AppBar not found. Please review Guide A03");
  });

  testWidgets('UI Component-Title AppBar Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    String titleAppBar = 'Contact Form';
    Finder findTitleAppBar = find.widgetWithText(AppBar, titleAppBar);
    checkOneWidget(findTitleAppBar, 'The correct title for Appbar is $titleAppBar');
  });

  testWidgets('UI Component-Form Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findFormWidget = find.byType(Form);
    checkOneWidget(findFormWidget, 'Add Form widget for body parameter in class. Review your Guide A03');
  });

  testWidgets('UI Component-ListView Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findListViewWidget = find.byType(ListView);
     checkOneWidget(findListViewWidget, 'Add ListView for child widget in Form. Look at your Guide A03 for the correct structure widget');
  });

  testWidgets('UI Component-4 TextFormField Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findTextFormField = find.byType(TextFormField);
    int count = 4;
    checkNWidget(findTextFormField, count, 
    'Your widgets TextFormField count is incomplete. Please complete up to $count');
  });
  
  testWidgets('UI Component-ElevatedButton', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findElevatedButton = find.byType(ElevatedButton);
    checkOneWidget(findElevatedButton, 'Add ElevatedButton at the end of 4 TextFormField');
  });

  testWidgets('UI Component-ElevatedButton-Update Not Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    String update = 'Update';
    Finder findTextUpdate = find.widgetWithText(ElevatedButton, update);
    checkNothing(findTextUpdate, 'This button should not exist');
  });

  testWidgets('UI Component-ElevatedButton-Add Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    String add = 'Add';
    Finder findTextAdd = find.widgetWithText(ElevatedButton, add);
    checkOneWidget(findTextAdd, 'Update Button required. Review your code and Guide A03');
  });

   
}