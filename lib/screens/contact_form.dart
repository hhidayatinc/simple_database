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
          key: Key('contact_form_appbar'),
            title: const Text('Contact Form', key: Key('title_appbar_contactform'),)
        ),
        body: Form(
          key: _form,
          child: ListView(
            key: Key('listview'),
            padding: const EdgeInsets.all(16.0),
            children: [
              Padding(
                key: Key('padding_name'),
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: TextFormField(
                  key: const Key('name_textformfield'),
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
                  },
                ),
              ),
              Padding(
                key: Key('padding_number'),
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: TextFormField(
                  key: const Key('number_textformfield'),
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Mobile No',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  validator: (value){
                    if(value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                  },
                ),
              ),
              Padding(
                key: Key('padding_email'),
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: TextFormField(
                  key: const Key('email_textformfield'),
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
                  },
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
              ),
              Padding(
                key: Key('padding_company'),
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: TextFormField(
                  key: const Key('company_textformfield'),
                  controller: companyController,
                  decoration: InputDecoration(
                      labelText: 'Company',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  validator: (value){
                    if(value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                  },
                ),
              ),
              Padding(
                key: Key('padding_button'),
                padding: const EdgeInsets.only(
                    top: 20
                ),
                child: ElevatedButton(
                  key: Key('elevatedbutton_contactform'),
                  child: (widget.contact == null)
                      ? const Text('Add', key: Key('add_text'),
                    style: TextStyle(color: Colors.white),
                  )
                      : const Text('Update', key: Key('update_text'),
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
      Navigator.pop(context, widget.contact);
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
      Navigator.pop(context, widget.contact);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Success add data'),
      ));
    }
  }
}
