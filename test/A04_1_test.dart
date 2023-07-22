import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_database/screens/contact_form.dart';
import 'package:simple_database/screens/contact_list.dart';

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

    testWidgets('UI Component-AppBar Found', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ContactList()));
      try{
        expect(find.byType(AppBar), findsOneWidget);
        print("Test Success!");
      }catch(e){
        print("Test Fail. AppBar not found ");
        print("Please check your code in ContactList class after widget Scaffold.");
      }
    });

  testWidgets('UI Component-Title AppBar Found', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    try{
      expect(find.widgetWithText(Center, 'ContactList'), findsOneWidget);
      print("Test Success!");
    }catch(e){
      print("Test Fail. Title AppBar not found");
      print("Please check the tittle. The correct title is ContactList");
    }
  });

    testWidgets('UI Component-ListView Found', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ContactList()));
      try {
        expect(find.byType(ListView), findsOneWidget);
        print("Test Success!");
      } catch(e){
        print("Test Fail. ListView not found");
        print("Add ListView widget after AppBar or check your guide again");
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
        print("Please review your code, and add a FloatingActionButton widget in the bottom right corner");
      }
    });
}