import 'package:flutter/material.dart';
import 'location.dart';

void main() {
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatefulWidget {
  @override
  _MyWeatherAppState createState() => _MyWeatherAppState();
}

class _MyWeatherAppState extends State<MyWeatherApp> {
  Location location = Location();

  @override
  void initState() {
    super.initState();
    location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
