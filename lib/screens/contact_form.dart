import 'package:flutter/material.dart';

import '../utils/contact.dart';
import '../utils/dbhelper.dart';

class ContactForm extends StatefulWidget{
  final Contact? contact;
  const ContactForm({Key? key, this.contact}) : super(key: key);
  @override
  ContactFormState createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm>{
  DbHelper db = DbHelper();
  TextEditingController? nameController;
  TextEditingController? numberController;
  TextEditingController? emailController;
  TextEditingController? companyController;
  final _form = GlobalKey<FormState>();
  @override
  void initState() {

    nameController = TextEditingController(
        text: widget.contact == null ? '' : widget.contact!.name);

    numberController = TextEditingController(
        text: widget.contact == null ? '' : widget.contact!.number);

    emailController = TextEditingController(
        text: widget.contact == null ? '' : widget.contact!.email);

    companyController = TextEditingController(
        text: widget.contact == null ? '' : widget.contact!.company);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Contact Form')
        ),
        body: Form(
          key: _form,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [

              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: TextFormField(
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Mobile No',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    // Check if this field is empty
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    // using regular expression
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Please enter a valid email address";
                    }
                    // the email is valid
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: TextFormField(
                  controller: companyController,
                  decoration: InputDecoration(
                      labelText: 'Company',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20
                ),
                child: ElevatedButton(
                  child: (widget.contact == null)
                      ? const Text('Add',
                    style: TextStyle(color: Colors.white),
                  )
                      : const Text('Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if(_form.currentState!.validate()){
                      _form.currentState!.save();
                      upsertContact();
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
  Future<void> upsertContact() async {
    if (widget.contact != null) {
      //update
      await db.updateContact(Contact(
          id: widget.contact!.id,
          name: nameController!.text,
          number: numberController!.text,
          email: emailController!.text,
          company: companyController!.text
      ));
      Navigator.pop(context, 'update');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Success update data'),
      ));
    } else {
      //insert
      await db.saveContact(Contact(
        name: nameController!.text,
        number: numberController!.text,
        email: emailController!.text,
        company: companyController!.text,
      ));
      Navigator.pop(context, 'save');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Success add data'),
      ));
    }
  }
}

