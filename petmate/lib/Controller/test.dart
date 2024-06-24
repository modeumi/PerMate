import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherModel {
  final double temp;
  final String weatherMain;
  final int humidity;
  final double? rain;
  final int code;

  WeatherModel({
    required this.temp,
    required this.weatherMain,
    required this.humidity,
    this.rain,
    required this.code,
  });
}

class WeatherService {
  Future<WeatherModel?> getWeather() async {
    Position position = await _determinePosition();
    String weatherData =
        "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=fd8662804c1d7656890c88c001f601a7&units=metric";

    try {
      final response = await http.get(Uri.parse(weatherData));

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

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 위치 서비스가 활성화되어 있는지 확인
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // 현재 위치 가져오기
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherModel? weather;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    WeatherService weatherService = WeatherService();
    weather = await weatherService.getWeather();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Weather'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : weather == null
              ? Center(child: Text('Failed to get weather data'))
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Temperature: ${weather!.temp}°C'),
                      Text('Condition: ${weather!.weatherMain}'),
                      Text('Humidity: ${weather!.humidity}%'),
                      Text('Rain: ${weather!.rain ?? 0}mm'),
                    ],
                  ),
                ),
    );
  }
}
