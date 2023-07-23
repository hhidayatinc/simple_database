import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_database/screens/contact_form.dart';
import 'package:simple_database/screens/contact_list.dart';

void main(){
  void checkOneWidget(Finder finder, String reason){
    expect(finder, findsOneWidget, reason: reason);
  }

  void checkNothing(Finder finder, String reason){
    expect(finder, findsNothing, reason: reason);
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

    testWidgets('UI Component-ListTile not found', (tester) async{
      await tester.pumpWidget(MaterialApp(home: ContactList()));
      Finder findListTile = find.byType(ListTile);
      checkNothing(findListTile, 'There is data show up, but actually nothing in list');
    });

    testWidgets('UI Component- FloatingButton Found', (WidgetTester tester) async{
      await tester.pumpWidget(MaterialApp(home: ContactList()));
      Finder findButtonAdd = find.widgetWithIcon(FloatingActionButton, Icons.add);
      checkOneWidget(findButtonAdd, "Please review your code, and add a FloatingActionButton widget in the bottom right corner");
      await tester.tap(findButtonAdd);
      await tester.pumpAndSettle();
      Finder findAppBar = find.byType(AppBar);
      checkOneWidget(findAppBar, "Please check your code in ContactList class after widget Scaffold.");
      String titleAppBar = 'Contact Form';
      Finder findTitleAppBar = find.widgetWithText(AppBar, titleAppBar);
      checkOneWidget(findTitleAppBar, "Widget AppBar not found. Please review Guide A03");
    });
}