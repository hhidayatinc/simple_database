import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_database/screens/contact_form.dart';
import 'package:simple_database/utils/contact.dart';

void main(){
  Contact c = Contact(name: "Risa", email: "risa@gmail.com", number: "087654389090", company: "Polinema");

  void checkOneWidget(Finder finder){
    const String trimStr1 = 'zero widgets with type "';
    const String trimStr2 = '" (ignoring offstage widget)';
    final finderMsg =
    finder.toString().replaceAll(trimStr1, '').replaceAll(trimStr2, '');
    expect(finder, findsOneWidget, reason: "Problem: Widget $finderMsg not found ");
  }

  void checkNothing(Finder finder){
    const String trimStr1 = 'exactly one widget with type "';
    const String trimStr2 = '" this widget should not exist';
    final finderMsg =
    finder.toString().replaceAll(trimStr1, '').replaceAll(trimStr2, '');
    expect(finder, findsNothing, reason: "Problem: $finderMsg not found");
  }

  testWidgets('UI Component-AppBar Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    Finder findAppBar = find.byKey(const Key("contact_form_appbar"));
    checkOneWidget(findAppBar);
  });

  testWidgets('UI Component-Title AppBar Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    Finder findTitleAppBar = find.byKey(const Key('title_appbar_contactform'));
    checkOneWidget(findTitleAppBar);
  });
  //
  testWidgets('UI Component-Form Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    Finder findFormWidget = find.byType(Form);
    checkOneWidget(findFormWidget);
  });
  //
  testWidgets('UI Component-ListView Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    Finder findListViewWidget = find.byKey(const Key('listview'));
    checkOneWidget(findListViewWidget);
  });
  //
  testWidgets('UI Component-TextFormField Name Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    Finder findTextFormField = find.byKey(const Key('name_textformfield'));
    checkOneWidget(findTextFormField);
  });
  testWidgets('UI Component-TextFormField Number Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    Finder findTextFormField = find.byKey(const Key('number_textformfield'));
    checkOneWidget(findTextFormField);
  });
  testWidgets('UI Component-TextFormField email Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    Finder findTextFormField = find.byKey(const Key('email_textformfield'));
    checkOneWidget(findTextFormField);
  });
  testWidgets('UI Component-TextFormField Company Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    Finder findTextFormField = find.byKey(const Key('company_textformfield'));
    checkOneWidget(findTextFormField);
  });
  testWidgets('UI Component-Padding Name Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    Finder findTextFormField = find.byKey(const Key('padding_name'));
    checkOneWidget(findTextFormField);
  });
  testWidgets('UI Component-Padding Number Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    Finder findTextFormField = find.byKey(const Key('padding_number'));
    checkOneWidget(findTextFormField);
  });
  testWidgets('UI Component-Padding email Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    Finder findTextFormField = find.byKey(const Key('padding_email'));
    checkOneWidget(findTextFormField);
  });
  testWidgets('UI Component-padding Company Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    Finder findTextFormField = find.byKey(const Key('padding_company'));
    checkOneWidget(findTextFormField);
  });
  //
  testWidgets('TextFormField Name has data', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    String name = c.name.toString();
    Finder findWidgetTextName = find.widgetWithText(TextFormField, name);
    checkOneWidget(findWidgetTextName);
  });

  testWidgets('TextFormField Email has data', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    String email = c.email.toString();
    Finder findWidgetTextEmail = find.widgetWithText(TextFormField, email);
    checkOneWidget(findWidgetTextEmail);
  });

  testWidgets('TextFormField Company has data', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    String company = c.name.toString();
    Finder findWidgetTextCompany = find.widgetWithText(TextFormField, company);
    checkOneWidget(findWidgetTextCompany);
  });

  testWidgets('TextFormField number phone has data', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    String company = c.company.toString();
    Finder findWidgetTextCompany = find.widgetWithText(TextFormField, company);
    checkOneWidget(findWidgetTextCompany);
  });
  //
  testWidgets('UI Component-ElevatedButton', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c,)));
    Finder findElevatedButton = find.byKey(const Key('padding_button'));
    checkOneWidget(findElevatedButton);
  });
  //
  testWidgets('UI Component-ElevatedButton-Update Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    Finder findTextUpdate = find.byKey(const Key('update_text'));
    checkOneWidget(findTextUpdate);
  });
  testWidgets('UI Component-ElevatedButton-Add Not Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactForm(contact: c)));
    Finder findTextUpdate = find.byKey(const Key('add_text'));
    checkNothing(findTextUpdate);
  });

}