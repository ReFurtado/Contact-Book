
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, camel_case_types

import 'package:contact_book/View/appbar.dart';
import 'package:contact_book/View/menu.dart';
import 'package:contact_book/View/register.dart';
import 'package:contact_book/View/search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage extends StatefulWidget {  
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {   
  @override
  Widget build(BuildContext context) {
      return Scaffold(

      //Title
      appBar: CustomAppbar(),

      //Menu
      drawer: MenuDrawer(),

      //Body
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,    
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [

              //title
              Column(
                children: [
                  Text(
                    "Welcome, what do you want to do?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),

              SizedBox(height: 30), //spacing

              //button search
              Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    //route
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Search())
                      );
                    },
                    //style
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff08808e),
                    ),
                    //button search
                    child: Container(
                      width: 180,
                      padding: const EdgeInsets.all(10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //icon
                          FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.white,
                            size: 16,
                          ),
                          Text(
                            "Search contacts",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),

              SizedBox(height: 10), //spacing

              //button register
              Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    //Route
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Register())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 38, 192, 209),
                    ),
                    //button 
                    child: Container(
                      width: 180,
                      padding: const EdgeInsets.all(10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //icon
                          FaIcon(
                            FontAwesomeIcons.userPlus,
                            color: Colors.white,
                            size: 16,
                          ),   
                          //text
                          Text(
                            "Register contact",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  );
                }
              ),         
            ],
          ),       
        ),
      )
    );
  }
}
