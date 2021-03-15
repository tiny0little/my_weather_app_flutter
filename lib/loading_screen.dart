import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'services.dart';
import 'resulting_screen.dart';

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

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => SecondRoute()),
    // );
    //

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultingScreen(
                cityName: weather.cityName,
                temperature: weather.temperature,
                condition: weather.condition,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.white54,
          size: 57,
        ),
      ),
    );
  }
}
