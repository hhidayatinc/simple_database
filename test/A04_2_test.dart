import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_database/screens/contact_form.dart';
import 'package:simple_database/screens/contact_list.dart';
import 'package:simple_database/utils/contact.dart';

List<Contact> cl = [
  Contact(name: "Risa", email: "risa@gmail.com", number: "087654389090", company: "Polinema")
];
void main() {
  void checkNWidget(Finder finder, int n, String reason) {
    expect(finder, findsNWidgets(n), reason: reason);
  }

  void checkOneWidget(Finder finder, String reason){
    expect(finder, findsOneWidget, reason: reason);
  }

  testWidgets('UI Component-AppBar Found', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    Finder findAppBar = find.byType(AppBar);
    checkOneWidget(findAppBar, "Please check your code in ContactList class after widget Scaffold.");
  });

  testWidgets('UI Component-Title AppBar Found', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    String titleAppBar = 'ContactList';
    Finder findTitleAppBar = find.widgetWithText(AppBar, titleAppBar);
    checkOneWidget(findTitleAppBar, 'The correct title for Appbar is $titleAppBar');
  });

  testWidgets('UI Component-ListView Found', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    Finder findListViewWidget = find.byType(ListView);
    checkOneWidget(findListViewWidget, 'Add ListView for child widget in Form. '
        'Look at your Guide A04 for the correct structure widget');
  });

  testWidgets("Contact List when there is data - List Tiles appear with the same number", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    int count = cl.length;
    Finder findListTile = find.byType(ListTile);
    for (int i = 0; i < cl.length; i++) {
      checkNWidget(findListTile, count, "There is $count data in list, but not all are retrieved");
    }
  });
  testWidgets("ContactList has data name", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    for (int i = 0; i < cl.length; i++) {
      String textName = '${cl[i].name}';
      Finder findTextName = find.text(textName);
      checkOneWidget(findTextName, 'Data Name not found or not match with the data in database');
    }
  });
  //correctcode
  testWidgets("ContactList has data number phone", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    for (int i = 0; i < cl.length; i++) {
      String textNumber = "Phone: ${cl[i].number}";
      Finder findTextNumber = find.text(textNumber);
      checkOneWidget(findTextNumber, 'Data Number not found or not match with the data in database');
    }
  });

  testWidgets("ContactList has data company ", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    for (int i = 0; i < cl.length; i++) {
      String textCompany = "Company: ${cl[i].company}";
      Finder findTextCompany = find.text(textCompany);
      checkOneWidget(findTextCompany, 'Data Company not found or not match with the data in database');
    }
  });

  testWidgets("ContactList has data email", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    for (int i = 0; i < cl.length; i++) {
      String textEmail = "Email: ${cl[i].email}";
      Finder findTextEmail = find.text(textEmail);
      checkOneWidget(findTextEmail, 'Data Email not found or not match with the data in database');
    }
  });

  testWidgets("Person icon found", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    for (int i = 0; i < cl.length; i++) {
      Finder findIconPerson = find.byIcon(Icons.person);
      int count = cl.length;
      checkNWidget(findIconPerson, count, 'Icon person on left data not found');
    }
  });

  //correct code
  testWidgets("Delete icon found", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    for (int i = 0; i < cl.length; i++) {
      Finder findIconDelete = find.byKey(Key('icon_delete_$i'));
      int count = cl.length;
      checkNWidget(findIconDelete, count, 'Icon Delete not found');
      await tester.tap(findIconDelete);
      await tester.pumpAndSettle();
      Finder findAlertDialog = find.byType(AlertDialog);
      checkOneWidget(findAlertDialog, 'There is no AlertDialog when tap the icon');
    }
  });

  //correctcode
  testWidgets("Edit icon found", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    for (int i = 0; i < cl.length; i++) {
      Finder findIconEdit = find.byKey(Key('icon_edit_$i'));
      int count = cl.length;
      checkNWidget(findIconEdit, count, 'tidak ditemukan');
      await tester.tap(findIconEdit);
      await tester.pumpAndSettle();
      String titleAppBar = 'Contact Form';
      Finder findTitleAppBar = find.widgetWithText(AppBar, titleAppBar);
      checkOneWidget(findTitleAppBar, "Widget AppBar not found. Please review Guide A03");
    }
  });
}



