// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbar extends AppBar {
  CustomAppbar() : super(
    automaticallyImplyLeading: false,
    centerTitle: true,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: FaIcon(
            FontAwesomeIcons.bars,
            size: 18,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      }
    ),
    //title
    title: Text(
      'Contact Book',
      style: TextStyle(
        fontSize: 18,
      ),
    ),
  );
}
