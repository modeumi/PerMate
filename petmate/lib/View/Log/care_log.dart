import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/main/main_log/care/care_circle.dart';
import 'package:petmate/Widget/main/main_log/care/care_container.dart';
import 'package:petmate/Widget/main/main_log/meal/meal_circle.dart';
import 'package:petmate/Widget/main/main_log/meal/meal_conatiner.dart';

class CareLog extends StatefulWidget {
  const CareLog({super.key});

  @override
  State<CareLog> createState() => _CareLogState();
}

class _CareLogState extends State<CareLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
            width: 360.w,
            height: 800.h,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Main/Background.png'),
                    fit: BoxFit.fill)),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  scrolledUnderElevation: 0,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      'assets/onboarding/icon_5.png',
                    ),
                  ),
                  title: Text(
                    '주의',
                    style: White(20.sp, FontWeight.w600),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     CareCircle(),
                      SizedBox(
                        height: 32.h,
                      ),
                     CareContainer(),
                      SizedBox(
                        height: 75.h,
                      ),
                    ],
                  ),
                )
              ],
            )),
        bottomNavigationBar: CustomBottomNavigationBar());
  }
}

