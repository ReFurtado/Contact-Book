// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:contact_book/Model/service.dart';
import 'package:contact_book/Model/contacts.dart'; 
import 'package:contact_book/View/appbar.dart';
import 'package:contact_book/View/menu.dart';
import 'package:contact_book/View/profile.dart';
import 'package:contact_book/View/register.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class Search extends StatefulWidget {
  @override
  State createState() => SearchState();
}

class SearchState extends State<Search> {
  //Model
  Service items = Service();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      drawer: MenuDrawer(),
      //Body
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 60),
        itemCount: items.listContacts().length,
        itemBuilder: (BuildContext context, int index) {
          //Return object
          Contact contact = items.listContacts().elementAt(index);   
          return Container(
            //color: Colors.grey,
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
            child: ListTile(
              title: Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  //Photo
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        contact.photo,
                        width: 60, 
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                  ),
                  SizedBox(width: 20),               
                  //Name & fone
                  Column(                
                    children: [                   
                      Text(
                        contact.name,
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        ),
                      ),
                      // Text(
                      //   contact.fone,
                      //   style: const TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 14,
                      //   ), 
                      // )
                    ],
                  ),
                ],
              ),
              onTap: () {
                  Navigator.push(
                    context,                   
                    MaterialPageRoute(
                      builder: (context) => Profile(id: contact.id),
                    )
                  );
                },
            ),
          );
        }
      ),
      //Button floating
      floatingActionButton: FloatingActionButton(
        child: const FaIcon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Register())
          );
        } 
      ),
    );
  }
}