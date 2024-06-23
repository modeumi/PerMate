import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:petmate/Model/air_model.dart';
import 'package:petmate/Model/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:petmate/Util/textstyles.dart';

class WeatherController extends GetxController {

  // Weather
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
      case 'Mist' || 'Smoke' || 'Dust' || 'Fog' || 'Sand' || 'Haze':
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

  // Air
  Color getairColor(double value) {
    if (value <= 30) {
      return Color(0xFF397CFF);
    } else if (value <= 80) {
      return Color(0xFF62FF7B);
    } else if (value <= 150) {
      return Color(0xFFFFDC62);
    } else if (value <= 151) {
      return Color(0xFFFF6262);
    } else {
      return Color(0xFF397CFF);
    }
  }

  Text getairText(double value) {
    if (value <= 30) {
      return Text(
        '좋음',
        style: White(14, FontWeight.w600),
      );
    } else if (value <= 80) {
      return Text('보통', style: White(14, FontWeight.w600));
    } else if (value <= 150) {
      return Text('나쁨', style: White(14, FontWeight.w600));
    } else if (value <= 151) {
      return Text('매우나쁨', style: White(14, FontWeight.w600));
    } else {
      return Text('좋음', style: White(14, FontWeight.w600));
    }
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

  
}
