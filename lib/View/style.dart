// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData style() {
  ThemeData base = ThemeData.dark();
  return base.copyWith(
    //
    primaryColor: Colors.green,
    colorScheme: ColorScheme.dark(),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.grey,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xff1E90FF),
      hoverColor: Color.fromARGB(255, 90, 156, 222), 
    )
  );
}