class Contact {
  int id;
  String name;
  String lastname;
  String email;
  String fone;
  String photo;

  Contact({
    required this.id, 
    required this.name,
    required this.lastname, 
    required this.email,
    required this.fone, 
    required this.photo,
  });

  static listContacts() {}
}