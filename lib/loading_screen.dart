import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'services.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
  Weather weather = Weather();

  @override
  void initState() {
    super.initState();
    getStarted();
  }

  void getStarted() async {
    await location.getLocation();
    await weather.getWeatherData(
        location.latitude.toString(), location.longitude.toString());
    print('city: ${weather.cityName}');
    print('temp: ${weather.temperature}');
    print('condition: ${weather.condition}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SpinKitThreeBounce(
            color: Colors.black38,
            size: 57,
          ),
        ),
      ),
    );
  }
}
