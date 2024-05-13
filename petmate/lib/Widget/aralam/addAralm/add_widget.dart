import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/aralam/addAralm/timepicker.dart';
import 'package:petmate/Widget/aralam/addAralm/weekselected.dart';
import 'package:petmate/Widget/button/alarm_toggle.dart';
import 'package:petmate/Widget/button/save_button.dart';

class AddAlarmWidget extends StatefulWidget {
  const AddAlarmWidget({super.key});

  @override
  State<AddAlarmWidget> createState() => _AddAlarmWidgetState();
}

class _AddAlarmWidgetState extends State<AddAlarmWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 344,
          height: 481,
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: GradientBoxBorder(
              width: 1,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.2)
                ],
              ),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: BlurryContainer(
            blur: 12,
            elevation: 0,
            borderRadius: BorderRadius.circular(10),
            child: Container(),
          ),
        ),
        Opacity(
          opacity: 0.4,
          child: Container(
            margin: EdgeInsets.all(3),
            width: 344,
            height: 481,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x4C000000),
                    blurRadius: 1,
                    offset: Offset(1, 1),
                    spreadRadius: 0,
                  )
                ],
                color: Color(0x3300287C),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Positioned(
          top: 12,
          left: 12,
          child: Text(
            '알람추가',
            style: White(16, FontWeight.w600),
          ),
        ),
        Positioned(
          right: 12,
          top: 12,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/image_asset/alarm/close.png'),
          ),
        ),
        Positioned(top: 48, left: 79, child: TimePicker()),
        Positioned(
          top: 164,
          left: 12,
          child: Text(
            '이름',
            style: White(16, FontWeight.w600),
          ),
        ),
        Positioned(
          top: 173,
          left: 12,
          child: Container(
            width: 320,
            height: 50,
            child: TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: '알람 이름/설명/내용 입력',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.6)),
                ),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white, decorationThickness: 0),
              cursorColor: Colors.white,
              cursorWidth: 2,
            ),
          ),
        ),
        Positioned(
          top: 234,
          left: 12,
          child: Text(
            '요일',
            style: White(16, FontWeight.w600),
          ),
        ),
        Positioned(
            top: 263,
            left: 12,
            child: Container(width: 321, child: SelectWeekWidget())),
        Positioned(
          top: 319,
          left: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '알람음',
                style: White(16, FontWeight.w600),
              ),
              Text(
                '기본',
                style: White(12, FontWeight.w500),
              ),
            ],
          ),
        ),
        Positioned(top: 324, right: 12, child: ToggleButtonWidget()),
        Positioned(
          top: 374,
          left: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '진동',
                style: White(16, FontWeight.w600),
              ),
              Text(
                '사용안함',
                style: White(12, FontWeight.w500),
              ),
            ],
          ),
        ),
        Positioned(
            top: 379, right: 12, child: Container(child: ToggleButtonWidget())),
        Positioned(
          bottom: 10,
          left: 6,
          child: Container(child: SaveButtonWidget()),
        )
      ],
    );
  }
}
