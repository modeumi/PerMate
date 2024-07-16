import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/main/main_log/shower/shower_circle.dart';
import 'package:petmate/Widget/main/main_log/toilet/toilet_circle.dart';
import 'package:petmate/Widget/main/main_log/toilet/toilet_container.dart';

class ToiletLog extends StatefulWidget {
  const ToiletLog({super.key});

  @override
  State<ToiletLog> createState() => _ToiletLogState();
}

class _ToiletLogState extends State<ToiletLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: CustomAppbar(
          title: '용변',
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
                child: ToiletCircle(),
              ),
              Positioned(top: 230.h, left: 8.w, child: ToiletContainer())
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar());
  }
}
