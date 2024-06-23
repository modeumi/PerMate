import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class SaveButton2Widget extends StatefulWidget {
  const SaveButton2Widget({super.key});

  @override
  State<SaveButton2Widget> createState() => _SaveButton2WidgetState();
}

class _SaveButton2WidgetState extends State<SaveButton2Widget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 320.w,
          height: 52.h,
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Color(0xFF2B80FF),
            border: GradientBoxBorder(
              width: 1,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.2)
                ],
              ),
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: BlurryContainer(
            blur: 12,
            elevation: 0,
            borderRadius: BorderRadius.circular(10.r),
            child: Container(),
          ),
        ),
        Opacity(
          opacity: 0.8,
          child: Container(
            margin: EdgeInsets.all(4),
            width: 320.w,
            height: 52.h,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 2,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  )
                ],
                color: Color(0xFF2B80FF),
                borderRadius: BorderRadius.circular(10.r)),
          ),
        ),
        Positioned(
          left: 155,
          top: 20,
          child: Text(
            '저장',
            style: White(16.sp, FontWeight.w600),
          ),
        )
      ],
    );
  }
}
