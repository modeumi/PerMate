import 'dart:convert';
import 'package:get/get.dart';
import 'package:petmate/Model/weather_model.dart';
import 'package:http/http.dart' as http;


class Weather extends GetxController {
  
}

 Future<WeatherModel?> getWeather() async {
    String WeatherData =
        "https://api.openweathermap.org/data/2.5/weather?q=suwon&appid=fd8662804c1d7656890c88c001f601a7&units=metric";
    try {
      final response = await http.get(Uri.parse(WeatherData));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print("데이터 확인: $data");

        double? rain =
            data["rain"] != null ? data["rain"]["1h"]?.toDouble() : null;

        WeatherModel weather = WeatherModel(
          temp: data["main"]["temp"],
          weatherMain: data["weather"][0]["main"],
          humidity: data["main"]["humidity"],
          rain: rain,
          code: data["weather"][0]["id"],
        );
        return weather;
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print(e);
      return null;
    }


    
  }

  
