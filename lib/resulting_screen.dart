import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loading_screen.dart';

class ResultingScreen extends StatefulWidget {
  final String cityName;
  final int temperature;
  final int condition;

  ResultingScreen(
      {@required this.cityName,
      @required this.temperature,
      @required this.condition});

  @override
  _ResultingScreenState createState() => _ResultingScreenState();
}

class _ResultingScreenState extends State<ResultingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.cityName),
          Text('${widget.temperature}°'),
          Text(
            getWeatherIcon(widget.condition),
            style: TextStyle(fontSize: 101),
          ),
          SizedBox(height: 51),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "City",
                ),
                style: TextStyle(
                  fontSize: 29,
                  fontFamily: 'Erased_Typewriter',
                ),
                onSubmitted: (text) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoadingScreen(query: text)),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

String getWeatherIcon(int condition) {
  if (condition < 300) {
    return '🌩';
  } else if (condition < 400) {
    return '🌧';
  } else if (condition < 600) {
    return '☔️';
  } else if (condition < 700) {
    return '☃️';
  } else if (condition < 800) {
    return '🌫';
  } else if (condition == 800) {
    return '☀️';
  } else if (condition <= 804) {
    return '☁️';
  } else {
    return '🤷‍';
  }
}
