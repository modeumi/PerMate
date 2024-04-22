import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  final String urlWeather;
  final String urlAir;

  Network(this.urlWeather, this.urlAir);

  // 날씨정보 API
  Future<dynamic> getWeatherData() async {
    http.Response response = await http.get(Uri.parse(urlWeather));

    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonEncode(jsonData));
      return parsingData;
    }
  }
  // 대기질 정보 API
   Future<dynamic> getAirData() async {
    http.Response response = await http.get(Uri.parse(urlAir));

    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonEncode(jsonData));
      return parsingData;
    }
  }
}
