class Contact{
  int? id;
  String? name;
  String? number;
  String? email;
  String? company;

  Contact({this.id,  this.name,  this.number,  this.email,  this.company});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['number'] = number;
    map['email'] = email;
    map['company'] = company;
    return map;
  }

  Contact.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    number = map['number'];
    email = map['email'];
    company = map['company'];
  }
}