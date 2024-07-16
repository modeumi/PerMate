import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class MedicalContainer extends StatefulWidget {
  const MedicalContainer({super.key});

  @override
  State<MedicalContainer> createState() => _MedicalContainerState();
}

class _MedicalContainerState extends State<MedicalContainer> {
   TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomContainer(
          width: 344.w,
          height: 665.h,
          shadow_color: Color(0x4C000000),
        ),
        Positioned(
            left: 12.w,
            top: 12.h,
            child: Text(
              '날짜 · 시간',
              style: White(14.sp, FontWeight.w600),
            )),
        Positioned(
          left: 12.w,
          top: 39.h,
          child: Container(
            width: 320.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.fromLTRB(1, 0, 0, 10),
                focusedBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
              ),
              style: TextStyle(
                color: Colors.black,
                decorationThickness: 0,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Pretendard',
              ),
              cursorColor: Colors.black,
              cursorWidth: 1.w,
            ),
          ),
        ),
      ],
    );
  }
}