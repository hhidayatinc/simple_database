import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_database/screens/contact_list.dart';

void main(){
  
    testWidgets('UI Component-AppBar found', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ContactList()));
      try{
        expect(find.byType(AppBar), findsOneWidget);
        print("Test Success!");
      }catch(e){
        print("Test Fail. AppBar not found ");
      }
    });

  testWidgets('UI Component-Title AppBar', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: ContactList()));
    try{
      expect(find.widgetWithText(Center, 'Contact List with Database SQLite'), findsOneWidget);
      print("Test Success!");
    }catch(e){
      print("Test Fail. Title AppBar not found");
    }
  });

    testWidgets('Komponen UI-ListView ditemukan', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ContactList()));
        expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Komponen UI-ListTile tidak ditemukan', (WidgetTester tester) async{
      await tester.pumpWidget(MaterialApp(home: ContactList()));
      
        expect(find.byType(ListTile), findsNothing);
    });

    testWidgets('Komponen UI- Floating button ditemukan', (WidgetTester tester) async{
      await tester.pumpWidget(MaterialApp(home: ContactList()));
      
        expect(find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
    });
}