import 'package:flutter/cupertino.dart';
import 'package:petmate/Model/current_air.dart';
import 'package:petmate/Model/current_weather.dart';
import 'package:petmate/data/mylocation.dart';
import 'package:petmate/data/network.dart';

class WeatherProvider extends ChangeNotifier {
  CurrentWeather weatherData = CurrentWeather();
  CurrentAir airData = CurrentAir();
  Widget image = Container();
  String text = '';
  double latitude = 0;
  double longitude = 0;
  bool loading = false;

  // 지역명, 온도, 습도, (초)미세먼지
  String cityName = '';
  int temp = 0;
  int humidity = 0;
  int pressure = 0;
  double? pm2_5;
  double? pm10;

  void getWeatherIcon() {
    int index = weatherData.weather![0].id!;

    if (index < 400) {
      image = Image.asset('assets/Main/weather (5).png');
    } else if (index < 700) {
      image = Image.asset('assets/Main/weather (4).png');
    } else if (index < 800) {
      image = Image.asset('assets/Main/weather (3).png');
    } else if (index == 800) {
      image = Image.asset('assets/Main/weather (1).png');
    } else if (index <= 804) {
      image = Image.asset('assets/Main/weather (2).png');
    } else {
      image = Image.asset('assets/Main/weather (2).png');
    }
    notifyListeners();
  }

  void getAirCondition() {
    int index = airData.listed![0].main!.aqi!;

    if (index == 1) {
      text = '매우 좋음';
    } else if (index == 2) {
      text = '좋음';
    } else if (index == 3) {
      text = '보통';
    } else if (index == 4) {
      text = '나쁨';
    } else if (index == 5) {
      text = '매우나쁨';
    } else {
      text = '매우나쁨';
    }
    notifyListeners();
  }

  void Save_Date(CurrentWeather weather, CurrentAir air) {
    weatherData = weather;
    airData = air;
    cityName = weatherData.name!;
    temp = weatherData.main!.temp!.round();
    pm2_5 = airData.listed![0].components!.pm2_5;
    pm10 = airData.listed![0].components!.pm10;
    getWeatherIcon();
    getAirCondition();
    notifyListeners();
  }

  void SetLocation(List<double> result) {
    latitude = result[0];
    longitude = result[1];
    notifyListeners();
  }

  void SetCity(Map<String, dynamic> result) {
    notifyListeners();
  }

  Future<void> Set_Weather() async {
    const apiKey = 'fd8662804c1d7656890c88c001f601a7';

    MyLocation myLocation = MyLocation();
    List<double> result = await myLocation.getMyCurrentLocation();
    SetLocation(result);
    String _baseApiWeather = 'https://api.openweathermap.org/data/2.5/weather';
    String _baseApiAir =
        'https://api.openweathermap.org/data/2.5/air_pollution';
    String _option = 'units=metric&lang=kr';
    String _lat = 'lat=${latitude}';
    String _lon = 'lon=${longitude}';
    Network network = Network(
        '$_baseApiWeather?$_lat&$_lon&appid=$apiKey&$_option',
        '$_baseApiAir?$_lat&$_lon&appid=$apiKey&$_option');

    Map<String, dynamic> networkresult = await network.getWeatherData();
    print('데이터 셋 : $networkresult');
    CurrentWeather inputcurrentWeatherData =
        CurrentWeather.fromJson(networkresult);

    // 대기질 정보 API 호출
    var airData = await network.getAirData();
    CurrentAir inputcurrentAirData = CurrentAir.fromJson(airData.toString());
    Save_Date(inputcurrentWeatherData, inputcurrentAirData);
    print('확인용');
    print(weatherData);
    print(weatherData.main!.temp);
    loading = true;
    notifyListeners();
  }
}