import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.redAccent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.redAccent,
      elevation: 0,
    ),
    textTheme: const TextTheme(
        bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 35,
    )));
