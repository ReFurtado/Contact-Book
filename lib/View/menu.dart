// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:contact_book/View/home_page.dart';
import 'package:contact_book/View/search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuDrawer extends StatelessWidget {

  //DB
  String user = "Pedro";
  String email = "p@gmail.com";
  String picture = "assets/image/avatar.jpg";

  //Title menu
  Text menuTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          //Infos
          UserAccountsDrawerHeader(
            accountName: Text(user), 
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  picture,
                  width: 60, 
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black26,
            ),
          ),        
          //Home
          ListTile(
            title: menuTitle('Home'),
            subtitle: Text('Home page'),
            //trailing: const FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(
              FontAwesomeIcons.house,
              size: 30,
            ),
            //ontap home
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
          //Contaxts
          ListTile(
            title: menuTitle('Contacts'),
            subtitle: const Text('Manager contacts'),
            //trailing: const FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(
              FontAwesomeIcons.userGroup,
              size: 30,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Search(), 
                ),
              );
            },
          )
        ],
      ),
    );
  }
}