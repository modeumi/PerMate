import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Controller/toggle_controller.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/button/alarm_toggle.dart';
import 'package:petmate/Widget/custom_container.dart';

class AlarmControlWidget extends StatefulWidget {
  const AlarmControlWidget({super.key});

  @override
  State<AlarmControlWidget> createState() => _AlarmControlWidgetState();
}

class _AlarmControlWidgetState extends State<AlarmControlWidget> {
  final ToggleButtonController controller = Get.put(ToggleButtonController());
  final _controllerbutton = ValueNotifier<bool>(false);
  bool _check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerbutton.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 10.w,
          top: 124.h,
          child: CustomContainer(
            width: 344.w,
            height: 96.h,
          ),
        ),
        Positioned(
            left: 24.w,
            top: 140.h,
            child: Text('약먹이기',
                style: TextStyle(
                  color: _controllerbutton.value
                      ? Colors.white
                      : Colors.white.withOpacity(0.6),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ))),
        Positioned(
            right: 24.w,
            top: 140.h,
            child: Text(
              '월,화,수,목,금',
              style: TextStyle(
                color: _controllerbutton.value
                    ? Colors.white
                    : Colors.white.withOpacity(0.6),
                fontSize: 12.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            )),
        Positioned(
          left: 24.w,
          top: 175.h,
          child: Container(
            width: 129,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '오전',
                  style: TextStyle(
                    color: _controllerbutton.value
                        ? Colors.white
                        : Colors.white.withOpacity(0.6),
                    fontSize: 14.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '09 : 00',
                  style: TextStyle(
                    color: _controllerbutton.value
                        ? Colors.white
                        : Colors.white.withOpacity(0.6),
                    fontSize: 28.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 24.w,
          top: 180.h,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0x3300287C),
                    border: GradientBoxBorder(
                      width: 1.w,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.2)
                        ],
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: AdvancedSwitch(
                    width: 48.w,
                    height: 24.h,
                    thumb: Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: ShapeDecoration(
                          color: _controllerbutton.value
                              ? Color(0xFF2B80FF)
                              : Color(0xFFC9C9C9),
                          shape: OvalBorder(),
                          shadows: [
                            BoxShadow(
                              color: Color(0x4C000000),
                              blurRadius: 3,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ]),
                    ),
                    activeColor: Color(0x3300287C),
                    inactiveColor: Color(0xff00297C33),
                    controller: _controllerbutton,
                    onChanged: (value) {
                      _check != _check;
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
