// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, must_be_immutable

import 'package:contact_book/Model/contacts.dart';
import 'package:contact_book/Model/service.dart';
import 'package:contact_book/View/appbar.dart';
import 'package:contact_book/View/menu.dart';
import 'package:contact_book/View/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatelessWidget {

  //Id selected
  int id;

  //Constructor
  Profile({ required this.id });

  //Object class
  Service items = Service();

  @override
  Widget build(BuildContext context) {

    //Model
    Contact service = items.listContacts().elementAt(id -1);

   return Scaffold(
    //Title
    appBar: CustomAppbar(),

    //Menu
    drawer: MenuDrawer(),

    //Body
    body: Container(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Column(
        children: [
          //Photo
            Row(
              children: [
                Image.asset(
                  service.photo,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                ),
              ]
            ),

          SizedBox(height: 20),
          //Name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${service.name} ${service.lastname}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          //Phone & email
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${service.fone}  |  ${service.email}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14
                )
              ),
            ],   
          ),
          //Divider
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Divider(
              height: 2,
            ),
          ),
          //Action
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Call
              Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.phone,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Call",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                    ),
                  ),
                ],
              ),
              //Message
              Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidMessage,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Message",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                    ),
                  ),
                ],
              ),
              //Call
              Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.video,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Video Call",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                    ),
                  )
                ],
              ),
              //Email
              Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidEnvelope,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Video Call",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                    ),
                  )
                ],
              ),
            ],
          )            
        ],
      ),
    ),
    //Button floating
      floatingActionButton: FloatingActionButton(
        child: FaIcon(
          FontAwesomeIcons.pen,
          color: Colors.white,
        ),
        onPressed: () {
        } 
      ),
   );
  }
}