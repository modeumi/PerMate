// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:http/http.dart' as http;
import 'package:petmate/Controller/weather_controller.dart';
import 'package:petmate/Model/air_model.dart';
import 'package:petmate/Model/weather_model.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/main/air.dart';

class WeatherWigdget extends StatefulWidget {
  const WeatherWigdget({
    super.key,
  });

  @override
  State<WeatherWigdget> createState() => _WeatherWigdgetState();
}

class _WeatherWigdgetState extends State<WeatherWigdget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.4,
          child: Container(
            width: 344,
            height: 172,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            decoration: BoxDecoration(
                boxShadow: [
                  const BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 2,
                      offset: Offset(1, 1),
                      spreadRadius: 0,
                      blurStyle: BlurStyle.outer)
                ],
                color: const Color(0x3300287C),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Container(
          width: 344,
          height: 172,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
          decoration: BoxDecoration(
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
          child: FutureBuilder<WeatherModel?>(
            future: getWeather(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.white.withOpacity(0.4),
                ));
              } else if (snapshot.hasError || !snapshot.hasData) {
                return Text('Failed to load weather data');
              } else {
                WeatherModel weather = snapshot.data!;
                return Stack(
                  children: [
                    Positioned(
                      left: 12,
                      top: 12,
                      child: Container(
                        width: 320,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('날씨', style: White(12, FontWeight.w600)),
                            Container(
                              width: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('반송동',
                                      style: White(10, FontWeight.w600)),
                                  GestureDetector(
                                    onTap: () {
                                      debugPrint('clicked~~');
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
                      left: 9,
                      top: 38,
                      // child: controller.image,
                      child: _buildWeatherIcon(weather.code),
                    ),
                    Positioned(
                      left: 77,
                      top: 44,
                      bottom: 70,
                      child: Container(
                        width: 50,
                        height: 64,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('${weather.temp.round()}°',
                                textAlign: TextAlign.center,
                                style: White(20, FontWeight.w600)),
                            Text('${_getWatherStatus(weather.weatherMain)}',
                                style: White(16, FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 137,
                      top: 38,
                      child: Container(
                        width: 58,
                        height: 64,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Opacity(
                                opacity: 0.6,
                                child: Text('강수 확률',
                                    style: White(10, FontWeight.w500))),
                            Text(
                                weather.rain != null
                                    // weatherMain == 'Rain' || weatherMain == 'Snow'
                                    ? '${weather.rain!.round()}%'
                                    : '0%',
                                style: White(14, FontWeight.w500)),
                            Container(
                              width: 58,
                              height: 16,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFF62BDFF)),
                              child: Text('습도: ${weather.humidity}%',
                                  textAlign: TextAlign.center,
                                  style: White(10, FontWeight.w500)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AirDataWidget(),
                    Positioned(
                        left: 42,
                        bottom: 0,
                        child: Image.asset('assets/Main/tree.png')),
                    Positioned(
                        left: 106,
                        bottom: 0,
                        child: Image.asset('assets/Main/tree.png')),
                    Positioned(
                        left: 170,
                        bottom: 0,
                        child: Image.asset('assets/Main/tree.png')),
                    Positioned(
                        right: 40,
                        bottom: 0,
                        child: _buildPetIcon(weather.weatherMain)),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherIcon(int? code) {
    if (code == null) {
      return Icon(Icons.error);
    }
    switch (code ~/ 100) {
      case 800:
        return Image.asset("assets/Main/sun.png");
      case 801:
        return Image.asset("assets/Main/cloudysun.png");
      case 8:
      case 7:
        return Image.asset('assets/Main/cloud.png');

      case 6:
        return Image.asset('assets/Main/snow.png');
      case 5:
      case 3:
      case 2:
        return Image.asset('assets/Main/rain.png');
      default:
        return Image.asset('assets/Main/sun.png');
    }
  }

  Widget _buildPetIcon(String weatherMain) {
    if (weatherMain == 'Rain' || weatherMain == 'Snow') {
      return Image.asset('assets/Main/home.png');
    } else {
      return Image.asset('assets/Main/pet.png');
      // return Image.asset('assets/Main/pet.png');
    }
  }

  String _getWatherStatus(String weatherMain) {
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
