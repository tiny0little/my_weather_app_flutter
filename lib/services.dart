import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';

const appid = '0f09ac41c5875f75012d28af5256d00c';

//
//
//
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
      // print('получил координаты успешно');
      // print(position);
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

  Future<void> getWeatherData(String lat, String lon, String q) async {
    var url;

    q == null
        ? url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
            'appid': appid,
            'lat': lat,
            'lon': lon,
          })
        : url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
            'appid': appid,
            'q': q,
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
