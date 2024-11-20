import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherModel {
  final double temp;
  final String weatherMain; //흐림정도
  final int humidity;
  final double? rain;
  final int code; //흐림정도의 id

  WeatherModel({
    required this.rain,
    required this.humidity,
    required this.temp,
    required this.weatherMain,
    required this.code,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'weatherMain': weatherMain,
      'humidity': humidity,
      'rain': rain,
      'code': code, 
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      temp: map['temp'] as double,
      weatherMain: map['weatherMain'] as String,
      humidity: map['humidity'] as int,
      rain: map['rain'] != null ? map['rain'] as double : null,
      code: map['code'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) => WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
