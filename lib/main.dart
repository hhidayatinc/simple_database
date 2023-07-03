import 'package:flutter/material.dart';
import 'package:simple_database/screens/contact_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Database SQLite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactList(),
    );
  }
}

