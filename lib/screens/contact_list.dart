// ignore_for_file: prefer_const_constructors

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
    Contact(name: "Risa", email: "risa@gmail.com", number: "087654389090", company: "Polinema")
  ];
  DbHelper db = DbHelper();
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
                      // button edit
                      IconButton(
                          onPressed: ()async {_openFormEdit(c);},
                          icon: const Icon(Icons.edit)
                      ),
                      // button hapus
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: (){
                          //membuat dialog konfirmasi hapus
                          AlertDialog hapus = AlertDialog(
                            title: const Text("Information"),
                            content: SizedBox(
                              height: 100,
                              child: Column(
                                children: [
                                  Text(
                                      "Yakin ingin Menghapus Data ${c.name}"
                                  )
                                ],
                              ),
                            ),

                            actions: [
                              TextButton(
                                  onPressed: () async{_deleteContact(c, i);},
                                  child: const Text("Ya")
                              ),
                              TextButton(
                                child: const Text('Tidak'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                          showDialog(context: context, builder: (context) => hapus);
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
        key: const Key('add icon'),
        child: const Icon(Icons.add),
        onPressed: () {
          _openFormCreate();
          },
      ),
    );
  }
    //mengambil semua data Contact
  Future<void> _getAllContact() async {
    //list menampung data dari database
    var list = await db.getAllContact();
    //ada perubahanan state
    setState(() {
      listContact.clear();
      //lakukan perulangan pada variabel list
      for (var data in list!) {
        //masukan data ke listContact
        listContact.add(Contact.fromMap(data));
      }
    });
  }

  //menghapus data Contact
  Future<void> _deleteContact(Contact contact, int position) async {
    await db.deleteContact(contact.id!);
    setState(() {
      listContact.removeAt(position);
    });
  }

  // membuka halaman tambah Contact
  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ContactForm()));
    if (result == 'save') {
      await _getAllContact();
    }
  }

  //membuka halaman edit Contact
  Future<void> _openFormEdit(Contact contact) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ContactForm(contact: contact)));
    if (result == 'update') {
      await _getAllContact();
    }
  }
}
  
