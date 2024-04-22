import 'package:geolocator/geolocator.dart';

class MyLocation {
  double latitude = 0;
  double longitude = 0;

  Future<List<double>> getMyCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      return [latitude, longitude];
    } catch (e) {
      print("There was a problem with the internet connection");
      return [];
    }
  }
}
