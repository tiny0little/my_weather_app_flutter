import 'package:flutter/material.dart';
import 'loading_screen.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 31,
            fontFamily: 'Erased_Typewriter',
          ),
        ),
      ),
      home: LoadingScreen()));
}
