import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:petmate/Model/air_model.dart';

Future<AirModel?> getAir() async {
  String airData =
      "http://api.openweathermap.org/data/2.5/air_pollution?lat=37.2911&lon=127.0089&appid=fd8662804c1d7656890c88c001f601a7";
  try {
    final response = await http.get(Uri.parse(airData));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print("미세먼지확인: $data");
      AirModel airdata = AirModel(
         pm2_5: data['list'][0]['components']['pm2_5'],
        pm10: data['list'][0]['components']['pm10'],
      );
      return airdata;
    } else {
      throw Exception('Failed to load air pollution data');
    }
  } catch (e) {
    print(e);
    return null;
  }
}
