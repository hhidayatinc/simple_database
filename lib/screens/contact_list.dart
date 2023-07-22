import 'package:flutter/material.dart';
import 'package:simple_database/utils/dbhelper.dart';

import '../utils/contact.dart';
import 'contact_form.dart';

class ContactList extends StatefulWidget{
  const ContactList({Key? key}) : super(key: key);

  @override
  ContactListState createState() => ContactListState();
}

class ContactListState extends State<ContactList>{
  List<Contact> listContact = [
    //Contact(name: "Risa", email: "risa@gmail.com", number: "087654389090", company: "Polinema")
  ];
  DbHelper db = DbHelper();
  void initState() {
    _getAllContact();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("ContactList"),
        ),
      ),
      body: ListView.builder(
        itemCount: listContact.length,
        itemBuilder: (context, i){
          Contact c = listContact[i];
          return Padding(
              padding: const EdgeInsets.only(
                  top: 20
              ),
              child: ListTile(
                  leading: const Icon(
                    Icons.person,
                    size: 50,
                  ),
                  title: Text(
                      '${c.name}'
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Text("Email: ${c.email}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Text("Phone: ${c.number}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Text("Company: ${c.company}"),
                      )
                    ],
                  ),
                  trailing:
                  FittedBox(
                      fit: BoxFit.fill,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: ()async {_openFormEdit(c);},
                              icon: const Icon(Icons.edit)
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: (){
                              AlertDialog delete = AlertDialog(
                                title: const Text("Information"),
                                content: SizedBox(
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Text(
                                          "Are you sure to delete this contact?"
                                      )
                                    ],
                                  ),
                                ),

                                actions: [
                                  TextButton(
                                      onPressed: () async{_deleteContact(c, i);
                                      Navigator.pop(context);},
                                      child: const Text("Yes")
                                  ),
                                  TextButton(
                                    child: const Text('No'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                              showDialog(context: context, builder: (context) => delete);
                            },
                          )
                        ],
                      )
                  )
              )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _openFormCreate();
        },
      ),
    );
  }

  Future<void> _getAllContact() async {
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
        context, MaterialPageRoute(builder: (context) => ContactForm()));
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
