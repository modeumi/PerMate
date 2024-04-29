import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class NaverMapController extends GetxController {
  Future<NLatLng> CurrentLocation() async {
    await Geolocator.openAppSettings();
    await Geolocator.openLocationSettings();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return NLatLng(position.latitude, position.longitude);
  }
}
