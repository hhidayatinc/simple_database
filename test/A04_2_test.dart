import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_database/screens/contact_form.dart';
import 'package:simple_database/screens/contact_list.dart';
import 'package:simple_database/utils/contact.dart';

List<Contact> cl = [
  Contact(name: "Risa", email: "risa@gmail.com", number: "087654389090", company: "Polinema")
];
void main() {

  testWidgets("Contact List when there is data - List Tiles appear with the same number", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    for (int i = 0; i < cl.length; i++) {
      try {
        expect(find.byType(ListTile, skipOffstage: false), findsNWidgets(cl.length),reason: "not Found");
        print("Test Success!");
      } catch(e){
        print("Test Fail.");
        print('The number of widget ListTile that appear is not the same as the data in the database');
        print('Please make sure you have followed the step in guide document');
      }
    }
  });
  testWidgets("ContactList has data name", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    for (int i = 0; i < cl.length; i++) {
      try {
        expect(find.widgetWithText(ListTile, '${cl[i].name}'),
            findsOneWidget);
        print("Test Success!");
      } catch(e){
        print("Test Failed");
        print("Contact Data Name Not Found");
        print('Please make sure you have followed the step in guide document');
      }
    }
  });
  //correctcode
  testWidgets("ContactList has data number phone", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    for (int i = 0; i < cl.length; i++) {
      try {
        expect(find.text("Phone: ${cl[i].number}"),
            findsOneWidget);
        print("Test Success");
      }catch(e) {
        print('Test Fail!');
        print("Contact data number phone Not Found");
        print('Please make sure you have followed the step in guide document');
      }
    }
  });

  testWidgets("ContactList has data company ", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    for (int i = 0; i < cl.length; i++) {
      try {
        expect(find.text("Company: ${cl[i].company}"),
            findsOneWidget);
        print("Test Success");
      }catch(e) {
        print('Test Fail!');
        print("Contact data company Not Found");
        print('Please make sure you have followed the step in guide document');
      }
    }
  });

  //correctcode
  testWidgets("ContactList has data email", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    for (int i = 0; i < cl.length; i++) {
      try {
        expect(find.text("Email: ${cl[i].email}"),
            findsOneWidget);
        print("Test Success");
      }catch(e) {
        print('Test Fail!');
        print("Contact data email Not Found");
        print('Please make sure you have followed the step in guide document');
      }
    }
  });

  //correct code
  testWidgets("Delete icon found", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: ContactList())); //hilangin param
    for (int i = 0; i < cl.length; i++) {
      try {
        await tester.pumpAndSettle();
        expect(find.widgetWithIcon(ListTile, Icons.delete),
            findsNWidgets(cl.length));
        print("Test Success!");
      } catch(e){
        print("Test Fail");
        print("Add IconButton delete in ListTile widget");
        print('Please make sure you have followed the step in guide document');
      }
    }
  });


  //correctcode
  testWidgets("Edit icon found", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    for (int i = 0; i < cl.length; i++) {
      try {
        expect(find.widgetWithIcon(ListTile, Icons.edit),
            findsNWidgets(cl.length));
        await tester.tap(find.byIcon(Icons.edit));
        await tester.pumpWidget(MaterialApp(home: ContactForm()));
        print("Test Success!");
      } catch(e){
        print("Test Fail.");
        print("Add IconButton edit in ListTile widget");
        print('Please make sure you have followed the step in guide document');
      }
    }
  });
}



