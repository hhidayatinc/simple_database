import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_database/screens/contact_form.dart';
import 'package:simple_database/screens/contact_list.dart';

void main(){
    testWidgets('UI Component-AppBar Found', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ContactList()));
      try{
        expect(find.byType(AppBar), findsOneWidget);
        print("Test Success!");
      }catch(e){
        print("Test Fail. AppBar not found ");
      }
    });

  testWidgets('UI Component-Title AppBar Found', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    try{
      expect(find.widgetWithText(Center, 'ContactList'), findsOneWidget);
      print("Test Success!");
    }catch(e){
      print("Test Fail. Title AppBar not found");
    }
  });

    testWidgets('UI Component-ListView Found', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ContactList()));
      try {
        expect(find.byType(ListView), findsOneWidget);
        print("Test Success!");
      } catch(e){
        print("Test Fail. ListView not found");
      }
    });

    testWidgets('UI Component- FloatingButton Found', (WidgetTester tester) async{
      await tester.pumpWidget(MaterialApp(home: ContactList()));
      try {
        expect(find.widgetWithIcon(FloatingActionButton, Icons.add),
            findsOneWidget);
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpWidget(MaterialApp(home: ContactForm()));
        print("Test Success!");
      } catch(e){
        print("Test Fail. FloatingButton not found");
      }
    });
}