import 'contacts.dart';

class Service {

  //List contacts
  static List<Contact> contacts = [];

  //Register contacts
  String registerContact(Contact contact) {
    contacts.add(contact);

    return "New contact: ${contact.name} ${contact.lastname}";
  }


  //DB
  List listContacts() {
    contacts = [

      Contact(
        id: 1,
        name: "Rafael",
        lastname: "A",
        email:"a@mail.com",
        fone: "(11) 2233445566",
        photo: "assets/image/contacts/1.jpg",
      ),

      Contact(
        id: 2,
        name: "Ana",
        lastname: "P",
        email:"p@mail.com",
        fone: "(11) 2233445566",
        photo: "assets/image/contacts/2.jpg",
      ),

      Contact(
        id: 3,
        name: "Marin",
        lastname: "K",
        email:"k@mail.com",
        fone: "(11) 2233445566",
        photo: "assets/image/contacts/3.jpg",
      ),

      Contact(
        id: 4,
        name: "Lucas",
        lastname: "F",
        email:"fa@mail.com",
        fone: "(11) 2233445566",
        photo: "assets/image/contacts/4.jpg",
      ),

      Contact(
        id: 5,
        name: "Karen",
        lastname: "L",
        email:"l@mail.com",
        fone: "(11) 2233445566",
        photo: "assets/image/contacts/5.jpg",
      ),
    ];

    return contacts;
  }
}