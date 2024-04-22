import 'dart:convert';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Model/current_air.dart';
import 'package:petmate/Model/current_weather.dart';
import 'package:petmate/Model/weather.dart';
import 'package:petmate/Provider/weatherprovider.dart';

import 'package:petmate/data/mylocation.dart';
import 'package:petmate/data/network.dart';
import 'package:provider/provider.dart';

const apiKey = 'fd8662804c1d7656890c88c001f601a7';

class WeatherWigdget extends StatefulWidget {
  const WeatherWigdget({
    super.key,
  });

  @override
  State<WeatherWigdget> createState() => _WeatherWigdgetState();
}

class _WeatherWigdgetState extends State<WeatherWigdget> {
  bool state2 = false;

  late double latitude2;
  late double longitude2;

  // 지역명, 온도, 습도, (초)미세먼지
  late String cityName;
  late int temp;
  late int humidity;
  late int pressure;
  final WeatherModel _model = WeatherModel();
  late Widget airState;
  double? pm2_5;
  double? pm10;

  @override
  void initState() {
    // TODO: implement initState
    getLocation();
    // fetchData();
  }

//  현재위치 호출
  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude2 = myLocation.latitude;
    longitude2 = myLocation.longitude;
    debugPrint('WeatherLoading.dart >> ' +
        latitude2.toString() +
        ' / ' +
        longitude2.toString());
    String _baseApiWeather = 'https://api.openweathermap.org/data/2.5/weather';
    String _baseApiAir =
        'https://api.openweathermap.org/data/2.5/air_pollution';
    String _option = 'units=metric&lang=kr';
    String _lat = 'lat=${latitude2.toString()}';
    String _lon = 'lon=${longitude2.toString()}';
    Network network = Network(
        '$_baseApiWeather?$_lat&$_lon&appid=$apiKey&$_option',
        '$_baseApiAir?$_lat&$_lon&appid=$apiKey&$_option');

    // 날씨 정보 API 호출
    var weatherData = await network.getWeatherData();
    debugPrint(weatherData.toString());
    CurrentWeather currentWeatherData = CurrentWeather.fromJson(weatherData);
    debugPrint(currentWeatherData.name);

    // 대기질 정보 API 호출
    var airData = await network.getAirData();
    debugPrint(airData.toString());
    CurrentAir currentAirData = CurrentAir.fromJson(airData);
    debugPrint(currentAirData.listed![0].main!.aqi!.toString());
  }

  // 지역명, 온도, 습도, (초)미세먼지
  void updateData(CurrentWeather weatherData, CurrentAir airData) {
    var timezone = weatherData.timezone!;

    int index = airData.listed![0].main!.aqi!;
    pm10 = airData.listed![0].components!.pm10;
    pm2_5 = airData.listed![0].components!.pm2_5;

    airState = _model.getAirCondition(index);

    cityName = weatherData.name!;
    temp = weatherData.main!.temp!.round();
    debugPrint('cityName[$cityName], temp[${weatherData.main!.temp}]');
    debugPrint('timezone[$timezone],');
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    if (weatherProvider.weatherData.weather!.isNotEmpty) {
      return CircularProgressIndicator();
    }

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 172,
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: state2 ? Colors.white.withOpacity(0.2) : Colors.transparent,
            border: GradientBoxBorder(
              width: 1,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.2)
                ],
              ),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: state2
              ? Container()
              : BlurryContainer(
                  blur: 12,
                  elevation: 0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(),
                ),
        ),
        Opacity(
          opacity: 0.4,
          child: Container(
            margin: EdgeInsets.all(8),
            width: double.infinity,
            height: 172,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 2,
                    offset: Offset(1, 1),
                    spreadRadius: 0,
                  )
                ],
                color: Color(0x3300287C),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Positioned(
          right: 12,
          top: 18,
          child: Container(
            width: 326,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '날씨',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  width: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '반송동',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint('clicked~~');
                          ;
                          ();
                        },
                        child: Image.asset(
                          'assets/Main/reset.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            left: 20,
            top: 42,
            child: _model
                .getWeatherIcon(weatherProvider.weatherData.weather![0].id!)),
        Positioned(
          left: 87,
          top: 42,
          child: Container(
            width: 44,
            height: 64,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${weatherProvider.weatherData.main!.temp!.round().toString()}\u2103',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${weatherProvider.weatherData.weather![0].description}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 140,
          top: 40,
          child: Container(
            width: 58,
            height: 64,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '강수 확률',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '100%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: 58,
                  height: 16,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF62BDFF)),
                  child: Text(
                    '습도 100%',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 90,
          top: 40,
          child: Container(
            width: 58,
            height: 64,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '미세 먼지',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${airState}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: 33,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFF6262),
                  ),
                  child: Text(
                    '$pm10',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 40,
          child: Container(
            width: 58,
            height: 64,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '초미세 먼지',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${airState}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: 33,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFF6262),
                  ),
                  child: Text(
                    '$pm2_5',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            left: 50, bottom: 11, child: Image.asset('assets/Main/tree.png')),
        Positioned(
            left: 110, bottom: 11, child: Image.asset('assets/Main/tree.png')),
        Positioned(
            left: 170, bottom: 11, child: Image.asset('assets/Main/tree.png')),
        Positioned(
            right: 60, bottom: 11, child: Image.asset('assets/Main/pet.png')),
      ],
    );
  }
}
