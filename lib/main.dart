import 'package:flutter/material.dart';
import 'loading_screen.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.white,
            elevation: 3,
            textStyle: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              fontFamily: 'Erased_Typewriter',
            ),
          ),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Erased_Typewriter',
          ),
        ),
      ),
      home: LoadingScreen()));
}
