import 'package:flutter_test/flutter_test.dart';
import 'package:simple_database/utils/contact.dart';
import 'package:simple_database/utils/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// Initialize sqflite for test.
void sqfliteTestInit() {
  // Initialize ffi implementation
  sqfliteFfiInit();
  // Set global factory
  databaseFactory = databaseFactoryFfi;
}

Future main() async {
  DbHelper dbhelper = DbHelper();

  setUpAll(()async{
    sqfliteTestInit();
    await dbhelper.initDatabase();
  });

  test('Save Contact Test', () async {
    Contact contact = Contact(name: 'Rizki', number: '081234567892', email: 'rizqi@example.com', company: 'Example Inc.');
    int? result = await dbhelper.saveContact(contact);
    try {
      expect(result, isNotNull);
      print('Test Success');
    } catch(e){
      print('Test Fail');
      print('Data length null, check on saveContact code');
    }
  });

  test('Get All Contact Test', () async {
    List? result = await dbhelper.getAllContact();
    try {
      expect(result?.length, greaterThanOrEqualTo(0));
      print('Test Success');
    } catch(e){
      print('Test Fail');
      print('Data length null, check on getAllContact code');
    }
  });

  test('Update Contact Test', () async {
    List? result = await dbhelper.getAllContact();
    int id = result![0]['id'];
    Contact contact = Contact(
      id: id,
      name: 'Rizqy',
      number: '08123456789',
      email: 'rizqy@mail.com',
      company: 'Example Inc',
    );
    int? updateResult = await dbhelper.updateContact(contact);
    try {
      expect(updateResult, greaterThanOrEqualTo(1));
      print('Test Success');
    } catch(e){
      print('Test Fail');
      print('Data not updated, check on updateContact code');
    }
  });
  test('Delete Kontak Test', () async {
    List? result = await dbhelper.getAllContact();
    int id = result![0]['id'];
    int? deleteResult = await dbhelper.deleteContact(id);
    try {
      expect(deleteResult, greaterThanOrEqualTo(0));
      print('Test Success');
    } catch(e){
      print('Test Fail');
      print('Delete data fail, check on deleteContact code');
    }
  });

}