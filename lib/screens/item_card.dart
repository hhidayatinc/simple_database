import 'package:flutter/material.dart';

import '../utils/contact.dart';

class ItemCard extends StatefulWidget{
  final Contact contact;
  final Future<void> onEditPress;
  final Future<void> onDeletePress;
  const ItemCard({Key? key, required this.contact, required this.onDeletePress, required this.onEditPress}) : super(key: key);
  ItemCardState createState() => ItemCardState();
}

class ItemCardState extends State<ItemCard>{
  @override
  Widget build(BuildContext context) {
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
                    '${widget.contact.name}'
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Email: ${widget.contact.email}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Phone: ${widget.contact.number}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Company: ${widget.contact.company}"),
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
                          onPressed: ()async {widget.onEditPress;},
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
                                      "Yakin ingin Menghapus Data ${widget.contact.name}"
                                  )
                                ],
                              ),
                            ),

                            actions: [
                              TextButton(
                                  onPressed: () async{widget.onDeletePress;},
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
  }
  
}