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

  void checkOneWidget(Finder finder){
    const String trimStr1 = 'zero widgets with type "';
    const String trimStr2 = '" (ignoring offstage widget)';
    final finderMsg =
    finder.toString().replaceAll(trimStr1, '').replaceAll(trimStr2, '');
    expect(finder, findsOneWidget, reason: "Problem: Widget $finderMsg not found ");
  }

  testWidgets('UI Component-AppBar Found', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactList()));
      Finder findAppBar = find.byKey(const Key('appbar_contactlist'));
      checkOneWidget(findAppBar);
    });

  testWidgets('UI Component-Title AppBar Found', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ContactList()));
    Finder findTitleAppBar = find.byKey(const Key('title_appbar_contactlist'));
    checkOneWidget(findTitleAppBar);
  });

    testWidgets('UI Component-ListView Found', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactList()));
      Finder findListViewWidget = find.byKey(const Key('listview_contactlist'));
      checkOneWidget(findListViewWidget);
    });

    testWidgets('UI Component- Padding ListTile not found', (tester) async{
      await tester.pumpWidget(const MaterialApp(home: ContactList()));
      Finder findListTile = find.byKey(const Key('padding_contactlist'));
      checkOneWidget(findListTile);
    });

  testWidgets("Contact List when there is data - List Tiles appear with the same number", (WidgetTester tester)async{
    await tester.pumpWidget(const MaterialApp(home: ContactList()));
    for (int i = 0; i < cl.length; i++) {
      Finder findListTile = find.byKey(Key('litstile_$i'));
      checkOneWidget(findListTile);
    }
  });


  testWidgets("ContactList has data name", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ContactList()));
    for (int i = 0; i < cl.length; i++) {
      String textName = '${cl[i].name}';
      Finder findTextName = find.text(textName);
      checkOneWidget(findTextName);
    }
  });
  //correctcode
  testWidgets("ContactList has data number phone", (WidgetTester tester)async{
    await tester.pumpWidget(const MaterialApp(home: const ContactList()));
    for (int i = 0; i < cl.length; i++) {
      String textNumber = "Phone: ${cl[i].number}";
      Finder findTextNumber = find.text(textNumber);
      checkOneWidget(findTextNumber);
    }
  });

  testWidgets("ContactList has data company ", (WidgetTester tester)async{
    await tester.pumpWidget(const MaterialApp(home: const ContactList()));
    for (int i = 0; i < cl.length; i++) {
      String textCompany = "Company: ${cl[i].company}";
      Finder findTextCompany = find.text(textCompany);
      checkOneWidget(findTextCompany);
    }
  });

  testWidgets("ContactList has data email", (WidgetTester tester)async{
    await tester.pumpWidget(const MaterialApp(home: const ContactList()));
    for (int i = 0; i < cl.length; i++) {
      String textEmail = "Email: ${cl[i].email}";
      Finder findTextEmail = find.text(textEmail);
      checkOneWidget(findTextEmail);
    }
  });

  testWidgets("Person icon found", (WidgetTester tester)async{
    await tester.pumpWidget(const MaterialApp(home: const ContactList()));
    for (int i = 0; i < cl.length; i++) {
      Finder findIconPerson = find.byIcon(Icons.person);
      int count = cl.length;
      checkNWidget(findIconPerson, count, 'Icon person on left data not found');
    }
  });

  //correct code
  testWidgets("Delete icon found", (WidgetTester tester)async{
    await tester.pumpWidget(const MaterialApp(home: const ContactList()));
    for (int i = 0; i < cl.length; i++) {
      Finder findIconDelete = find.byKey(Key('icon_delete_$i'));
      int count = cl.length;
      checkNWidget(findIconDelete, count, 'Icon Delete not found');
      await tester.tap(findIconDelete);
      await tester.pumpAndSettle();
      Finder findAlertDialog = find.byKey(Key('alertdialog'));
      checkOneWidget(findAlertDialog);
    }
  });

  //correctcode
  testWidgets("Edit icon found", (WidgetTester tester)async{
    await tester.pumpWidget(const MaterialApp(home: const ContactList()));
    for (int i = 0; i < cl.length; i++) {
      Finder findIconEdit = find.byKey(Key('icon_edit_$i'));
      int count = cl.length;
      checkNWidget(findIconEdit, count, 'tidak ditemukan');
      await tester.tap(findIconEdit);
      await tester.pumpAndSettle();
      String titleAppBar = 'Contact Form';
      Finder findTitleAppBar = find.widgetWithText(AppBar, titleAppBar);
      checkOneWidget(findTitleAppBar);
    }
  });
}



