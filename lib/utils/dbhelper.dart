import 'package:simple_database/utils/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class DbHelper{
  static final DbHelper instance = DbHelper._internal();

  factory DbHelper() => instance;

  DbHelper._internal();

  static Database? _database;

  final String tableName = 'contact';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnNumber = 'number';
  final String columnEmail = 'email';
  final String columnCompany = 'company';

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database?> initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    final databasesPath = await getApplicationDocumentsDirectory();
    final path = join(databasesPath.path, 'contactList.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableName(
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT,
            $columnNumber TEXT,
            $columnEmail TEXT,
            $columnCompany TEXT
          )
        ''');
      },
    );
  }

  Future<int?> saveContact(Contact contact) async {
    var dbClient = await database;
    return await dbClient!.insert(tableName, contact.toMap());
  }

  Future<List?> getAllContact() async {
    var db = await database;
    var result = await db!.query(tableName, columns: [
      columnId,
      columnName,
      columnCompany,
      columnNumber,
      columnEmail
    ]);
    return result.toList();
  }

  //update database
  Future<int?> updateContact(Contact contact) async {
    var dbClient = await database;
    return await dbClient!.update(tableName, contact.toMap(), where: '$columnId = ?', whereArgs: [contact.id]);
  }

  //hapus database
  Future<int?> deleteContact(int id) async {
    final dbClient = await database;
    return await dbClient!.delete(tableName,  where: '$columnId = ?', whereArgs: [id]);
  }
}