import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/main/main_log/meal/meal_circle.dart';
import 'package:petmate/Widget/main/main_log/meal/meal_conatiner.dart';
import 'package:petmate/Widget/main/main_log/medical/medical_circle.dart';
import 'package:petmate/Widget/main/main_log/medical/medical_container.dart';

class MedicalLog extends StatefulWidget {
  const MedicalLog({super.key});

  @override
  State<MedicalLog> createState() => _MedicalLogState();
}

class _MedicalLogState extends State<MedicalLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: CustomAppbar(
          title: '진료',
        ),
        body: Container(
          width: 360.w,
          height: 800.h,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Main/Background.png'),
                  fit: BoxFit.fill)),
          child: Stack(
            children: [
              Positioned(
                top: 102.h,
                left: 132.w,
                child: MedicalCircle(),
              ),
              Positioned(top: 230.h, left: 8.w, child: MedicalContainer())
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar());
  }
}
