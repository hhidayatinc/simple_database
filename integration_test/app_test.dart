// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:simple_database/screens/contact_form.dart';
import 'package:simple_database/screens/contact_list.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', (){
    testWidgets('tap on the floating action button', (tester) async{
      await tester.pumpWidget(const MaterialApp(home: const ContactList()));
      Finder appBartitle = find.widgetWithText(AppBar, 'ContactList');
      expect(appBartitle, findsOneWidget);
      Finder findFloatingActionButton = find.byKey(Key('button_add'));
      expect(findFloatingActionButton, findsOneWidget);
      await tester.tap(findFloatingActionButton);
      await tester.pumpAndSettle();
      String titleAppBar = 'Contact Form';
      Finder findTitleAppBar = find.widgetWithText(AppBar, titleAppBar);
      expect(findTitleAppBar, findsOneWidget);
    });
    testWidgets('Isi data on ContactForm', (tester) async{
      await tester.pumpWidget(const MaterialApp(home: ContactForm()));
      String titleAppBar = 'Contact Form';
      Finder findTitleAppBar = find.widgetWithText(AppBar, titleAppBar);
      expect(findTitleAppBar, findsOneWidget);
      Finder nameText = find.byKey(const Key('name_textformfield'));
      await tester.enterText(nameText, 'Riri');
      Finder numberText = find.byKey(const Key('number_textformfield'));
      await tester.enterText(numberText, '085235655323');
      Finder emailText = find.byKey(const Key('email_textformfield'));
      await tester.enterText(emailText, 'riri@gmail.com');
      Finder companyText = find.byKey(const Key('company_textformfield'));
      await tester.enterText(companyText, 'polinema');
      Finder addButton = find.widgetWithText(ElevatedButton, 'Add');
      await tester.tap(addButton);
      await tester.pumpAndSettle();
      await tester.pumpWidget(const MaterialApp(home: ContactList()));
      Finder appBartitle = find.byKey(Key('appbar_contactlist'));
      expect(appBartitle, findsOneWidget);
    });
    // testWidgets('test di contactlist', (tester) async{
    //   await tester.pumpWidget(const MaterialApp(home: ContactForm()));
    //   String titleAppBar = 'Contact Form';
    //   Finder findTitleAppBar = find.widgetWithText(AppBar, titleAppBar);
    //   expect(findTitleAppBar, findsOneWidget);
    //   Finder nameText = find.byKey(const Key('name_textformfield'));
    //   await tester.enterText(nameText, 'Riri');
    //   Finder numberText = find.byKey(const Key('number_textformfield'));
    //   await tester.enterText(numberText, '085235655323');
    //   Finder emailText = find.byKey(const Key('email_textformfield'));
    //   await tester.enterText(emailText, 'riri@gmail.com');
    //   Finder companyText = find.byKey(const Key('company_textformfield'));
    //   await tester.enterText(companyText, 'polinema');
    //   Finder addButton = find.widgetWithText(ElevatedButton, 'Add');
    //   await tester.tap(addButton);
    //   await tester.pumpAndSettle();
    //   await tester.pumpWidget(const MaterialApp(home: ContactForm()));
    //   Finder appBartitle = find.byKey(Key('appbar_contactlist'));
    //   expect(appBartitle, findsOneWidget);
    // });
  });
}