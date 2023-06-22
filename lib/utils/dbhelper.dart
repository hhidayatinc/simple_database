import 'package:simple_database/utils/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

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
}