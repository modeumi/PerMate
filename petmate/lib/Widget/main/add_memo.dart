import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Util/textstyles.dart';

import 'package:petmate/Widget/button/save_button.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';
import 'package:petmate/Widget/main/memo/memo_overlay.dart';

class MeMoWidget extends StatefulWidget {
  const MeMoWidget({super.key});

  @override
  State<MeMoWidget> createState() => _MeMoWidgetState();
}

class _MeMoWidgetState extends State<MeMoWidget> {
  var opactiyValue = 1.0;

  void Deletedoevrlay(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      setState(() {
        opactiyValue = 1.0;
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: Color(0x66303030),
          context: context,
          builder: (BuildContext context) {
            return MemoOverlay();
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
            left: 30.w,
            bottom: 18.h,
            child: Container(
              width: 88.w,
              height: 32.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/Main/memo.png'),
                  Text('메모 추가',
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
