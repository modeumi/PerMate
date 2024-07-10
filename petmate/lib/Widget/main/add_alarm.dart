import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Alarm/alarm_add.dart';
import 'package:petmate/Widget/aralam/addAralm/add_widget.dart';
import 'package:petmate/Widget/aralam/addAralm/aralm_timepicker.dart';
import 'package:petmate/Widget/aralam/addAralm/weekselected.dart';
import 'package:petmate/Widget/button/alarm_toggle.dart';
import 'package:petmate/Widget/custom_container.dart';

class AlarmWidget extends StatefulWidget {
  const AlarmWidget({super.key});

  @override
  State<AlarmWidget> createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidget> {
  OverlayEntry? deletoverlay;
  var opactiyValue = 1.0;

  void Deletedoevrlay(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      setState(() {
        opactiyValue = 1.0;
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          barrierColor: Color(0x66303030).withOpacity(0.4),
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return AnimatedContainer(
                duration: Duration(milliseconds: 0),
                child: Stack(
                  children: [
                    Positioned(
                      top: 168,
                      left: 7,
                      child: Container(
                        child: AddAlarmWidget(),
                      ),
                    ),
                  ],
                ));
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Deletedoevrlay(context);
      },
      child: Stack(
        children: [
          CustomContainer(
              width: 168.w, height: 64.h, shadow_color: Color(0x26000000)),
          Positioned(
            left: 30,
            bottom: 18,
            child: Container(
              width: 88.w,
              height: 32.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/Main/alarm.png'),
                  Text('알람 추가',
                      textAlign: TextAlign.center,
                      style: White(12.sp, FontWeight.w500)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
