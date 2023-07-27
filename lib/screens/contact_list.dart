import 'package:flutter/material.dart';
import 'package:simple_database/utils/dbhelper.dart';
import 'package:sqflite/sqflite.dart';

import '../utils/contact.dart';
import 'contact_form.dart';

class ContactList extends StatefulWidget{
  const ContactList({Key? key}) : super(key: key);

  @override
  ContactListState createState() => ContactListState();
}

class ContactListState extends State<ContactList>{
  // int count =0;
  List<Contact> listContact = [
    Contact(name: "Risa", email: "risa@gmail.com", number: "087654389090", company: "Polinema")
  ];
  DbHelper db = DbHelper();
  void initState() {
    super.initState();
    _getAllContact();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          key: Key('appbar_contactlist'),
          child: Text("ContactList", key: Key('title_appbar_contactlist'),),
        ),
      ),
      body: ListView.builder(
        key: const Key('listview_contactlist'),
        itemCount: listContact.length,
        itemBuilder: (context, i){
          Contact c = listContact[i];
            return Padding(
              key: const Key('padding_contactlist'),
                padding: const EdgeInsets.only(
                    top: 20
                ),
                child: ListTile(
                  key: Key('litstile_$i'),
                    leading: const Icon(
                      Icons.person,
                      key: Key('icon_person'),
                      size: 50,
                    ),
                    title: Text(
                      '${c.name}',
                      key:const Key('text_name'),
                    ),
                    subtitle: Column(
                      key: const Key('column_contactlist'),
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          key: const Key('padding_email'),
                          padding: const EdgeInsets.only(
                            top: 8,
                          ),
                          child: Text("Email: ${c.email}"),
                        ),
                        Padding(
                          key: const Key('padding_number'),
                          padding: const EdgeInsets.only(
                            top: 8,
                          ),
                          child: Text("Phone: ${c.number}"),
                        ),
                        Padding(
                          key: const Key('padding_company'),
                          padding: const EdgeInsets.only(
                            top: 8,
                          ),
                          child: Text("Company: ${c.company}"),
                        )
                      ],
                    ),
                    trailing:
                    FittedBox(
                      key: const Key('fittedbox_contactlist'),
                        fit: BoxFit.fill,
                        child: Row(
                          key: const Key('row_contactlist'),
                          children: [
                            IconButton(
                                key: Key('icon_edit_$i'),
                                onPressed: () async {
                                  _openFormEdit(c);
                                },
                                icon: const Icon(Icons.edit)
                            ),
                            IconButton(
                              key: Key('icon_delete_$i'),
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                AlertDialog delete = AlertDialog(
                                  key: const Key('alertdialog'),
                                  title: const Text("Information"),
                                  content: SizedBox(
                                    height: 100,
                                    child: Column(
                                      children: [
                                        const Text(
                                            "Are you sure to delete this contact?",
                                          key: Key('confirmation_text'),
                                        )
                                      ],
                                    ),
                                  ),

                                  actions: [
                                    TextButton(
                                      key: const Key('textdeletebutton'),
                                        onPressed: () async {
                                          _deleteContact(c, i);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Yes")
                                    ),
                                    TextButton(
                                      key: const Key('textcancelbutton'),
                                      child: const Text('No'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                                showDialog(context: context,
                                    builder: (context) => delete);
                              },
                            )
                          ],
                        )
                    )
                )
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('button_add'),
        child: const Icon(Icons.add, key: Key('icon_add'),),
        onPressed: () {
          _openFormCreate();
        },
      ),
    );
  }

  Future<void> _getAllContact() async {
    // final Future<Database?> dbFuture = db.initDatabase();
    // dbFuture.then((value) {
    //   Future<List<Contact>> contactListFuture = db.getAllContact();
    //   contactListFuture.then((listContact) {
    //     setState(() {
    //       this.listContact = listContact;
    //       this.count = listContact.length;
    //     });
    //   });
    // });
    var list = await db.getAllContact();
    setState(() {
      listContact.clear();
      for (var data in list!) {
        listContact.add(Contact.fromMap(data));
      }
    });
  }

  Future<void> _deleteContact(Contact contact, int position) async {
    await db.deleteContact(contact.id!);
    setState(() {
      listContact.removeAt(position);
    });
  }

  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ContactForm()));
    if (result == 'save') {
      await _getAllContact();
    }
  }

  Future<void> _openFormEdit(Contact contact) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ContactForm(contact: contact)));
    if (result == 'update') {
      await _getAllContact();
    }
  }
}
