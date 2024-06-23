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
import 'package:petmate/View/Alarm/alarm_add.dart';
import 'package:petmate/Widget/aralam/alarm_control.dart';
import 'package:petmate/Widget/aralam/alarm_deleted.dart';
import 'package:petmate/Widget/button/alarm_toggle.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/button/deletedbutton/alarm_deleted_button.dart';
import 'package:petmate/Widget/custom_appbar.dart';

class AlarmDeletedPage extends StatefulWidget {
  const AlarmDeletedPage({super.key});

  @override
  State<AlarmDeletedPage> createState() => _AlarmDeletedPageState();
}

class _AlarmDeletedPageState extends State<AlarmDeletedPage> {
  bool state2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: '알람',
        action: [
          GestureDetector(
              onTap: () {
                Get.to(() => AlarmAddPage());
              },
              child: Image.asset('assets/image_asset/alarm/add.png')),
          GestureDetector(
              onTap: () {
                Get.to(() => AlarmDeletedPage());
              },
              child: Image.asset('assets/alert/delete(24).png'))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: 850,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Main/Background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 98.h,
              left: 77.w,
              child: Opacity(
                opacity: 0.6,
                child: Text(
                  '켜져있는 알람이 홈 화면 상단에 노출됩니다.',
                  style: White(12, FontWeight.w500),
                ),
              ),
            ),
            AlarmDeletedWidget(),
            // Expanded(
            //   child: NotificationListener(
            //     child: ListView(
            //       children: [AlarmDeletedWidget()],
            //     ),
            //   ),
            // ),
            Positioned(bottom: 75, left: 10, child: AlarmDeletedButton()),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
