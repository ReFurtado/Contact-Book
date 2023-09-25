// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors

import 'dart:io';
import 'package:contact_book/Model/contacts.dart';
import 'package:contact_book/Model/service.dart';
import 'package:contact_book/View/appbar.dart';
import 'package:contact_book/View/menu.dart';
import 'package:contact_book/View/search.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Register extends StatefulWidget {
  @override
  State createState() => RegisterState();
}

class RegisterState extends State<Register> {
   
  //Controller imput
  final name = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final fone = TextEditingController();
  final photo = TextEditingController();

  //photo
  late File arquivo;
  final picker = ImagePicker();

  Future getFileFromGallery() async {
    final file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() => arquivo = File(file.path));
    }
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Container(
         alignment: Alignment.center,
         //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
         //decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(10),
          //color: const Color.fromARGB(255, 242, 214, 132),        
         child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            //Title
            Container(
              child: Text(
                "New Contact",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
              ),
            ),

            SizedBox(height: 30), //spacing

            //Imputs
            Input("Name", name),
            Input("Lastname", lastname),
            Input("E-mail", email),
            Input("Fone", fone),
            //Input("Photo", photo),


            //Attach file
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  icon: IconTheme(
                    data: IconThemeData(color: Colors.white),
                    child: Icon(Icons.attach_file),
                  ),
                  label: Text(
                    'Select a file',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                  ),
                  onPressed: () => getFileFromGallery(), 
                )
              ],
            ),

            SizedBox(height: 20), //spacing

        
            //Bottons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                //Clean
                Builder(
                  builder: (BuildContext context) {
                    return ElevatedButton(
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 90,
                        padding: EdgeInsets.all(10),
                      
                        child: Text(
                          "Clean",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                        
                      onPressed: () {
                        Clean();
                      }

                    );
                  }
                ),
                
                //Register
                Builder(
                  builder: (BuildContext context) {
                    return ElevatedButton(
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 90,
                        padding: EdgeInsets.all(10),
                      
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff08808e),
                      ),
                        
                      onPressed: () {
                        Register();
                      }

                    );
                  }
                ),

              ],
            )
          ],
        ),
      ),
      )
    );
  }

    //Input
    // ignore: non_constant_identifier_names
    Container Input(String nameInput, TextEditingController controller) {
      return Container(
              margin: EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: nameInput,
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff08808e),
                    )
                  )
                ),
              ),
            );
    }

    //Register
    void Register() {
      Service contact = Service();
      Contact register = Contact (
        id: 1, 
        name: name.text, 
        lastname: lastname.text, 
        email: email.text, 
        fone: fone.text, 
        photo: photo.text
      );

      String message = contact.registerContact(register);

        //Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: TextStyle(
                color: Colors.white,
              )
            ),
            duration: Duration(milliseconds: 2000),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Color(0xff08808e),
          ),
        );

        //Redirection
        Future.delayed(
          Duration(milliseconds: 2500),
          () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => Search())
            );
          }
        );

    }

    //Clean
    // ignore: non_constant_identifier_names
    void Clean() {
      name.text = "";
      lastname.text = "";
      email.text = "";
      fone.text = "";
      photo.text = "";
    }

}

