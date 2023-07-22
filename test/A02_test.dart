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
    Contact contact = Contact(name: 'Rizkia', number: '081234567892', email: 'rizqi@example.com');
    int? result = await dbhelper.saveContact(contact);
      expect(result, contact.id, reason: "There is something wrong with your saveContact code, back to guideA02");

  });

  test('Get All Contact Test', () async {
    List? result = await dbhelper.getAllContact();
      expect(result?.length, greaterThanOrEqualTo(0), reason: "There is something wrong with your getAllContact code. "
          "Back to Guide A02");
  });

  test('Update Contact Test-Column Name', () async {
    List? result = await dbhelper.getAllContact();
    int id = result![0]['id'];
    String email = result[0]['email'];
    String number = result[0]['number'];
    String company = result[0]['company'];
    Contact contact = Contact(
      id: id,
      name: 'Ana',
      number: number,
      email: email,
      company: company,
    );
    int? updateResult = await dbhelper.updateContact(contact);
      expect(updateResult, greaterThanOrEqualTo(1));
  });
  test('Update Contact Test-Column number', () async {
    List? result = await dbhelper.getAllContact();
    int id = result![0]['id'];
    String email = result[0]['email'];
    String name = result[0]['name'];
    String company = result[0]['company'];
    Contact contact = Contact(
      id: id,
      name: name,
      number: '0879652437',
      email: email,
      company: company,
    );
    int? updateResult = await dbhelper.updateContact(contact);
      expect(updateResult, greaterThanOrEqualTo(1));
  });
 
 test('Update Contact Test-Column email', () async {
    List? result = await dbhelper.getAllContact();
    int id = result![0]['id'];
    String name = result[0]['name'];
    String number = result[0]['number'];
    String company = result[0]['company'];
    Contact contact = Contact(
      id: id,
      name: name,
      number: number,
      email: 'ana@gmail.com',
      company: company,
    );
    int? updateResult = await dbhelper.updateContact(contact);
      expect(updateResult, greaterThanOrEqualTo(1));
  });

  test('Update Contact Test-Column Company', () async {
    List? result = await dbhelper.getAllContact();
    int id = result![0]['id'];
    String email = result[0]['email'];
    String number = result[0]['number'];
    String name = result[0]['name'];
    Contact contact = Contact(
      id: id,
      name: name,
      number: number,
      email: email,
      company: 'Polinema',
    );
    int? updateResult = await dbhelper.updateContact(contact);
      expect(updateResult, greaterThanOrEqualTo(1));
  });

  test('Delete Kontak Test', () async {
    List? result = await dbhelper.getAllContact();
    int id = result![0]['id'];
    int? deleteResult = await dbhelper.deleteContact(id);
      expect(deleteResult, 1, reason: "There is something wrong in delete code");
  });

}