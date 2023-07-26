import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_database/screens/contact_form.dart';

void main(){

  void checkOneWidget(Finder finder){
    const String trimStr1 = 'zero widgets with type "';
    const String trimStr2 = '" (ignoring offstage widget)';
    final finderMsg =
    finder.toString().replaceAll(trimStr1, '').replaceAll(trimStr2, '');
    expect(finder, findsOneWidget, reason: "Problem: Widget $finderMsg not found ");
  }

  void checkNothing(Finder finder){
    const String trimStr1 = 'exactly one widget with type "';
    const String trimStr2 = '" this button should not exist';
    final finderMsg =
    finder.toString().replaceAll(trimStr1, '').replaceAll(trimStr2, '');
    expect(finder, findsNothing, reason: "Problem: $finderMsg");
  }

  testWidgets('UI Component-AppBar Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findAppBar = find.byKey(Key("contact_form_appbar"));
    checkOneWidget(findAppBar);
  });

  testWidgets('UI Component-Title AppBar Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findTitleAppBar = find.byKey(Key('title_appbar_contactform'));
    checkOneWidget(findTitleAppBar);
  });
  //
  testWidgets('UI Component-Form Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findFormWidget = find.byType(Form);
    checkOneWidget(findFormWidget);
  });
  //
  testWidgets('UI Component-ListView Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findListViewWidget = find.byKey(Key('listview'));
     checkOneWidget(findListViewWidget);
  });
  //
  testWidgets('UI Component-TextFormField Name Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findTextFormField = find.byKey(Key('name_textformfield'));
    checkOneWidget(findTextFormField);
  });
  testWidgets('UI Component-TextFormField Number Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findTextFormField = find.byKey(Key('number_textformfield'));
    checkOneWidget(findTextFormField);
  });
  testWidgets('UI Component-TextFormField email Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findTextFormField = find.byKey(Key('email_textformfield'));
    checkOneWidget(findTextFormField);
  });
  testWidgets('UI Component-TextFormField Company Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findTextFormField = find.byKey(Key('company_textformfield'));
    checkOneWidget(findTextFormField);
  });
  testWidgets('UI Component-Padding Name Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findTextFormField = find.byKey(Key('padding_name'));
    checkOneWidget(findTextFormField);
  });
  testWidgets('UI Component-Padding Number Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findTextFormField = find.byKey(Key('padding_number'));
    checkOneWidget(findTextFormField);
  });
  testWidgets('UI Component-Padding email Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findTextFormField = find.byKey(Key('padding_email'));
    checkOneWidget(findTextFormField);
  });
  testWidgets('UI Component-padding Company Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findTextFormField = find.byKey(Key('padding_company'));
    checkOneWidget(findTextFormField);
  });
  //
  testWidgets('UI Component-ElevatedButton', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findElevatedButton = find.byKey(Key('padding_button'));
    checkOneWidget(findElevatedButton);
  });

  testWidgets('UI Component-ElevatedButton', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findElevatedButton = find.byKey(Key('elevatedbutton_contactform'));
    checkOneWidget(findElevatedButton);

  });
  //
  testWidgets('UI Component-ElevatedButton-Update Not Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findTextUpdate = find.byKey(Key('update_text'));
    checkNothing(findTextUpdate);
  });
  //
  testWidgets('UI Component-ElevatedButton-Add Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm()));
    Finder findTextAdd = find.byKey(Key('add_text'));
    checkOneWidget(findTextAdd);
  });
}