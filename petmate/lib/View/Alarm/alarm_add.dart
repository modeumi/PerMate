import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Alarm/alarm_deleted.dart';
import 'package:petmate/Widget/aralam/addAralm/add_widget.dart';
import 'package:petmate/Widget/button/alarm_toggle.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/custom_appbar.dart';

class AlarmAddPage extends StatefulWidget {
  const AlarmAddPage({super.key});

  @override
  State<AlarmAddPage> createState() => _AlarmAddPageState();
}

class _AlarmAddPageState extends State<AlarmAddPage> {
  bool state2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            width: 360.w,
            height: 850.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Main/Background.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                CustomAppbar(
                  title: '알람',
                  action: [
                    Image.asset('assets/image_asset/alarm/add.png'),
                    Image.asset('assets/alert/delete(24).png')
                  ],
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CustomBottomNavigationBar()),
                Container(
                  color: Color(0x66303030).withOpacity(0.4),
                  width: 360.w,
                  height: 800.h,
                ),
                Positioned(top: 80.h, left: 7.w, child: AddAlarmWidget()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
