import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

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
            top: 12,
            right: 12,
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset('assets/image_asset/alarm/close.png'))),
        Positioned(
            top: 12,
            right: 12,
            child: Image.asset('assets/image_asset/alarm/close.png'))
      ],
    );
  }
}
