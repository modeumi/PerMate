import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/Model/weather_model.dart';
import 'package:http/http.dart' as http;






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

class WeatherController extends GetxController {
   Widget buildWeatherIcon(int? code) {
    if (code == null) {
      return Icon(Icons.error);
    }

    if (code == 800) {
      return Image.asset("assets/Main/sun.png");
    } else if (code == 801) {
      return Image.asset("assets/Main/cloudysun.png");
    } else if (code >= 802 && code <= 804) {
      return Image.asset('assets/Main/cloud.png');
    } else if (code >= 700 && code < 800) {
      return Image.asset('assets/Main/cloud.png');
    } else if (code >= 600 && code < 700) {
      return Image.asset('assets/Main/snow.png');
    } else if (code >= 500 && code < 600) {
      return Image.asset('assets/Main/rain.png');
    } else if (code >= 300 && code < 400) {
      return Image.asset('assets/Main/rain.png');
    } else if (code >= 200 && code < 300) {
      return Image.asset('assets/Main/rain.png');
    } else {
      return Icon(Icons.error);
    }
  }

    Widget buildPetIcon(String weatherMain) {
    if (weatherMain == 'Rain' || weatherMain == 'Snow') {
      return Image.asset('assets/Main/home.png');
    } else {
      return Image.asset('assets/Main/pet.png');
      // return Image.asset('assets/Main/pet.png');
    }
  }

  String getWatherStatus(String weatherMain) {
    switch (weatherMain) {
      case 'Clear':
        return '맑음';
      case 'Few clouds':
        return '흐림';
      case 'Clouds':
        return '구름';
      case 'Rain':
        return '비';
      case 'Mist' || 'Smoke' || 'Dust' || 'Fog' || 'Sand':
        return '안개';
      case 'Drizzle':
        return '이슬비';
      case 'Thunderstorm':
        return '뇌우';
      case 'Snow':
        return '눈';

      default:
        return weatherMain;
    }
  }
}




