import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';

class Location {
  double latitude;
  double longitude;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest,
          timeLimit: Duration(seconds: 3));

      latitude = position.latitude;
      longitude = position.longitude;
      print('получил координаты успешно');
      print(position);
    } catch (e) {
      print(e);
    }
  }
}

class Weather {
  var weatherData;
  int temperature;
  String cityName;
  int condition;

  Future<void> getWeatherData(String lat, String lon) async {
    var url = Uri.https('samples.openweathermap.org', '/data/2.5/weather', {
      'appid': 'b6907d289e10d714a6e88b30761fae22',
      'lat': lat,
      'lon': lon,
    });

    http.Response response = await http.get(url);

    weatherData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      weatherData = jsonDecode(response.body);
      temperature = (weatherData['main']['temp'] - 273.15).round();
      cityName = weatherData['name'].toString();
      condition = weatherData['weather'][0]['id'];
    }
  }
}
