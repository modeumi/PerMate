import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:petmate/Widget/bottom_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/main/add_alarm.dart';
import 'package:petmate/Widget/main/add_memo.dart';
import 'package:petmate/Widget/main/log/log.dart';
import 'package:petmate/Widget/main/main_alram.dart';
import 'package:petmate/Widget/main/memo.dart';
import 'package:petmate/Widget/main/profile.dart';
import 'package:petmate/Widget/main/profile_info.dart';

import 'package:petmate/Widget/main/walk/walk.dart';
import 'package:petmate/Controller/navigation_controller.dart';
import 'package:petmate/Widget/main/weatherwidget/weather.dart';

class MainPage extends StatefulWidget {
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
        height: 812.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Main/Background.png'),
              fit: BoxFit.fill),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainAlram(),
                ProfilePlus(),
                SizedBox(
                  height: 30.h,
                ),
                ProfileInfoWidget(),
                SizedBox(
                  height: 8.h,
                ),
                WeatherWigdget(),
                MemoWriteWidget(),
                Center(
                  child: Container(
                    width: 342.w,
                    height: 142.h,
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
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomBottomNavigationBar())
          ],
        ),
      ),
    );
  }
}
