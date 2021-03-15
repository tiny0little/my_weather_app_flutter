import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultingScreen extends StatelessWidget {
  final String cityName;
  final int temperature;
  final int condition;

  ResultingScreen(
      {@required this.cityName,
      @required this.temperature,
      @required this.condition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('город: $cityName', textAlign: TextAlign.center),
          Text('температура: $temperature', textAlign: TextAlign.center),
          Text('condition: ' + getWeatherIcon(condition),
              textAlign: TextAlign.center),
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
