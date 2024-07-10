// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/Controller/weather_controller.dart';
import 'package:petmate/Model/weather_model.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/main/weatherwidget/air.dart';
import 'package:petmate/Widget/main/weatherwidget/area.dart';

class WeatherWigdget extends StatefulWidget {
  const WeatherWigdget({
    super.key,
  });

  @override
  State<WeatherWigdget> createState() => _WeatherWigdgetState();
}

class _WeatherWigdgetState extends State<WeatherWigdget> {
  final WeatherController weatherController = Get.put(WeatherController());
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: 344.w,
      height: 172.h,
      margin: EdgeInsets.symmetric(horizontal: 8),
      color: Color(0x3300287C),
      gradient: LinearGradient(
        colors: [Colors.transparent, Colors.white.withOpacity(0.2)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.2),
          Colors.white.withOpacity(0.2),
          Colors.white.withOpacity(0.2),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.10, 0.30, 0.40, 0.0],
      ),
      blur: 12,
      borderRadius: BorderRadius.circular(10.r),
      borderWidth: 1,
      elevation: 0,
      boxShadow: [
        BoxShadow(
          color: Color(0x26000000),
          blurRadius: 2,
          offset: Offset(2, 2),
          spreadRadius: 0,
        )
      ],
      child: FutureBuilder<WeatherModel?>(
        future: weatherController.getWeather(),
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
                  left: 12.w,
                  top: 10.h,
                  child: Container(
                    width: 320.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('날씨', style: White(12.sp, FontWeight.w600)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AreaData(),
                            GestureDetector(
                              onTap: () {
                                Get.find<WeatherController>()
                                    .getWeather(forceRefresh: true)
                                    .then((_) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                              },
                              child: Image.asset(
                                'assets/Main/reset.png',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 9,
                  top: 38,
                  child: weatherController.buildWeatherIcon(weather.code),
                ),
                Positioned(
                  left: 77,
                  top: 44,
                  bottom: 70,
                  child: Container(
                    width: 50.w,
                    height: 64.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('${weather.temp.round()}°',
                            textAlign: TextAlign.center,
                            style: White(20, FontWeight.w600)),
                        Text(
                            '${weatherController.getWatherStatus(weather.weatherMain)}',
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
                                style: White(10.sp, FontWeight.w500))),
                        Text(
                            weather.rain != null
                                ? '${weather.rain!.round()}%'
                                : '0%',
                            style: White(14.sp, FontWeight.w500)),
                        Container(
                          width: 58,
                          height: 16,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF62BDFF)),
                          child: Text('습도: ${weather.humidity}%',
                              textAlign: TextAlign.center,
                              style: White(10.sp, FontWeight.w500)),
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
                    child: weatherController.buildPetIcon(weather.weatherMain)),
              ],
            );
          }
        },
      ),
    );
  }
}
