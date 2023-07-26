import 'package:simple_database/utils/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class DbHelper{
  static final DbHelper instance = DbHelper._internal();

  factory DbHelper() => instance;

  DbHelper._internal();

  late BuildContext context;

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database?> initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      final databasesPath = await getApplicationDocumentsDirectory();
      final path = join(databasesPath.path, 'contactList.db');
      return openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
          CREATE TABLE contact(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            number TEXT NOT NULL,
            email TEXT NOT NULL,
            company TEXT NOT NULL
          )
        ''');
        },
      );
    } catch(e){
      print('Error opening database: $e');
    }
  }

  Future<int?> saveContact(Contact contact) async {
    var dbClient = await database;
    try {
     int result = await dbClient!.rawInsert(
          "INSERT INTO contact (name, number, email, company) VALUES (?, ?, ?, ?)",
          [contact.name, contact.number, contact.email, contact.company]);
     // return result;
    } catch(e){
      showDialog(
          context: context, // Use the appropriate BuildContext
          builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("An error occurred while saving data."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
      return 0;
    }
  }

  Future<List?> getAllContact() async {
    var db = await database;
    try {
      var result = await db!.rawQuery("SELECT * FROM contact");
      return result.toList();
    } catch(e){
      showDialog(
        context: context, // Use the appropriate BuildContext
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("An error occurred while retrieving data."),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
      return null;
    }
  }

  Future<int?> updateContact(Contact contact) async {
    var dbClient = await database;
    try{
    var result = await dbClient!.rawUpdate("UPDATE contact SET name=?, number=?, email=?, company=? WHERE id=?",
        [contact.name, contact.number, contact.email, contact.company, contact.id]);
    return result;
    }catch(e){
      showDialog(
        context: context, // Use the appropriate BuildContext
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("An error occurred while updating data."),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
      return 0;
    }
  }
  Future<int?> deleteContact(int id) async {
    final dbClient = await database;
    try {
      int result = await dbClient!.rawDelete("DELETE FROM contact WHERE id=?", [id]);
      return result;
    } catch(e){
      showDialog(
        context: context, // Use the appropriate BuildContext
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("An error occurred while deleting data."),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
      return 0;
    }
  }

}

