import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petmate/Model/current_air.dart';
import 'package:petmate/Model/current_weather.dart';
import 'package:petmate/Widget/bottom_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/main/add_alarm.dart';
import 'package:petmate/Widget/main/add_memo.dart';
import 'package:petmate/Widget/main/log.dart';
import 'package:petmate/Widget/main/main_alram.dart';
import 'package:petmate/Widget/main/memo.dart';
import 'package:petmate/Widget/main/profile.dart';
import 'package:petmate/Widget/main/walk.dart';
import 'package:petmate/Widget/main/weather.dart';
import 'package:petmate/Controller/navigation_controller.dart';

class MainPage extends StatefulWidget {
  // final CurrentWeather weatherData;
  // final CurrentAir airData;
  // const MainPage({super.key, required this.weatherData, required this.airData});
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final BottomNavigationBarController _bottomNavigationBarController =
      Get.put(BottomNavigationBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 812,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Main/Background.png'),
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainAlram(),
              ProfilePlus(),
              SizedBox(
                height: 115,
              ),
              // WeatherWigdget(),
              MemoWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LogWidget(),
                  WalkWidget(),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AlarmWidget(),
                  MeMoWidget(),
                ],
              ),
              CustomBottomNavigationBar(),
            ],
          ),
        ),
      ),
      bottomSheet: CustomBottomNavigationBar(),
    );
  }
}
