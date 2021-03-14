import 'package:geolocator/geolocator.dart';

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
