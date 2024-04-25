import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  final String urlWeather;
  final String urlAir;

  Network(this.urlWeather, this.urlAir);

  // 날씨정보 API
  Future<Map<String, dynamic>> getWeatherData() async {
    // print(' 주소 : $urlWeather');
    http.Response response = await http.get(Uri.parse(urlWeather));

    print('스테이터스 코드 : ${response.statusCode}');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      print('데이터 확인1 :parsingData');
      print(data);
      return data;
    }
    return {};
  }

  // 대기질 정보 API
  Future<Map<String, dynamic>> getAirData() async {
    http.Response response = await http.get(Uri.parse(urlAir));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      print('데이터 확인2 :parsingData');
      print(data);
      return data;
    }
    return {};
  }
}
