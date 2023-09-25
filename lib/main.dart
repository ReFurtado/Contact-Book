
import 'package:contact_book/View/home_page.dart';
import 'package:contact_book/View/style.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: "Contact Book",
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    theme: style(),
  )
);
