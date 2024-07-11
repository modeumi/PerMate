import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/main/add_alarm.dart';
import 'package:petmate/Widget/main/add_memo.dart';
import 'package:petmate/Widget/main/log/log.dart';
import 'package:petmate/Widget/main/main_alram.dart';
import 'package:petmate/Widget/main/memo/memo.dart';
import 'package:petmate/Widget/main/profile.dart';
import 'package:petmate/Widget/main/profile_info.dart';

import 'package:petmate/Widget/main/walk/walk.dart';
import 'package:petmate/Widget/main/weatherwidget/weather.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: 812.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Main/Background.png'),
              fit: BoxFit.fill),
        ),
        child: Container(
          child: Column(
            children: [
              MainAlram(),
              SizedBox(
                height: 8.h,
              ),
              ProfilePlus(),
              SizedBox(
                height: 12.h,
              ),
              ProfileInfoWidget(),
              SizedBox(
                height: 12.h,
              ),
              WeatherWigdget(),
              SizedBox(
                height: 12.h,
              ),
              MemoWriteWidget(),
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: Container(
                  width: 344.w,
                  height: 135.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LogWidget(),
                          WalkWidget(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AlarmWidget(),
                          MeMoWidget(),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
