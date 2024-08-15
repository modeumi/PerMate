import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/walk_log.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class WalkWidget extends StatefulWidget {
  const WalkWidget({super.key});

  @override
  State<WalkWidget> createState() => _WalkWidgetState();
}

class _WalkWidgetState extends State<WalkWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(WalkLog());
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
                  Image.asset('assets/Main/walk.png'),
                  Text('산책 하기',
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
