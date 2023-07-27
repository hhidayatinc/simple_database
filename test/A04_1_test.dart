import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_database/screens/contact_form.dart';
import 'package:simple_database/screens/contact_list.dart';

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
    const String trimStr2 = '" this widget should not exist';
    final finderMsg =
    finder.toString().replaceAll(trimStr1, '').replaceAll(trimStr2, '');
    expect(finder, findsNothing, reason: "Problem: $finderMsg");
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
      checkNothing(findListTile);
    });

  testWidgets('UI Component- ListTile not found', (tester) async{
    await tester.pumpWidget(const MaterialApp(home: ContactList()));
    Finder findListTile = find.byType(ListTile);
    checkNothing(findListTile);
  });


    testWidgets('UI Component- FloatingButton Found', (WidgetTester tester) async{
      await tester.pumpWidget(const MaterialApp(home: ContactList()));
      Finder findButton = find.byKey(const Key('button_add'));
      Finder findIconAdd = find.byKey( const Key('icon_add'));
      checkOneWidget(findIconAdd);
      checkOneWidget(findButton);
      await tester.tap(findButton);
      await tester.pumpAndSettle();
      Finder findAppBar = find.byType(AppBar);
      checkOneWidget(findAppBar);
      Finder findTitleAppBar = find.byKey(const Key('title_appbar_contactform'));
      checkOneWidget(findTitleAppBar);
    });
}