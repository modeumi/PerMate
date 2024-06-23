import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Alarm/alarm_add.dart';
import 'package:petmate/View/Alarm/alarm_deleted.dart';
import 'package:petmate/Widget/aralam/alarm_control.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/profile/deleted/mypet_deleted_widget.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
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
        width: 360.w,
        height: 850.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Main/Background.png'),
              fit: BoxFit.fill),
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
                  style: White(12.sp, FontWeight.w500),
                ),
              ),
            ),
            AlarmControlWidget(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
