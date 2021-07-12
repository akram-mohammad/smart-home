import 'package:flutter/material.dart';

ThemeData regularThemeData() {
  return ThemeData(
    // Define the default brightness and colors.
    // brightness: Brightness.dark,
    primaryColor: Color(0xFF28292B),
    accentColor: Color(0xFF1FD38F),
    primaryColorLight: Colors.white,
    cardColor: Color(0xFF36373A),

    // Define the default font family.
    fontFamily: 'Bozon',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 36.0, fontWeight: FontWeight.w700, color: Colors.white),
        headline2: TextStyle(
            fontSize: 36.0, fontWeight: FontWeight.w700, color: Colors.white),
        headline3: TextStyle(
            fontSize: 32.0, fontWeight: FontWeight.w700, color: Colors.white),
        headline4: TextStyle(
            fontSize: 30.0, fontWeight: FontWeight.w700, color: Colors.white),
        headline5: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
        headline6: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white),
        bodyText1: TextStyle(fontSize: 14.0, color: Colors.white, height: 1.6),
        bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
        caption: TextStyle(
            fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.white)),
  );
}
