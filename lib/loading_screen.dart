import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'services.dart';

class LoadingScreen extends StatefulWidget {
  final String query;

  LoadingScreen({this.query});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Weather weather = Weather();
  Location location = Location();

  @override
  void initState() {
    super.initState();
    getStarted();
  }

  void getStarted() async {
    // if query defined we do not need device location
    if (widget.query != null) {
      await weather.getWeatherData(null, null, widget.query);
    } else {
      await location.getLocation();
      await weather.getWeatherData(
          location.latitude.toString(), location.longitude.toString(), null);
    }

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
