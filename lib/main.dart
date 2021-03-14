import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'services.dart';

void main() {
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatefulWidget {
  @override
  _MyWeatherAppState createState() => _MyWeatherAppState();
}

class _MyWeatherAppState extends State<MyWeatherApp> {
  Location location = Location();
  Weather weather = Weather();

  @override
  void initState() {
    super.initState();
    getStarted();
  }

  void getStarted() async {
    await location.getLocation();
    await weather.getWeatherData(location.latitude, location.longitude);
    print('temp: ' + weather.weatherData['main']['temp']);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.teal,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
