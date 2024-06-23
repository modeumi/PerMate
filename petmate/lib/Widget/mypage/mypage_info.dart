import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_container.dart';

class MypageInfo extends StatefulWidget {
  const MypageInfo({super.key});

  @override
  State<MypageInfo> createState() => _MypageInfoState();
}

class _MypageInfoState extends State<MypageInfo> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomContainer(
          width: 344.w,
          height: 300.h,
        ),
        Positioned(
          top: 16.h,
          left: 16.w,
          child: Text(
            '내정보',
            style: White(14.sp, FontWeight.w600),
          ),
        ),
        Positioned(
            left: 16.w,
            top: 50.h,
            child: Container(
              width: 312,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.3,
                  color: Colors.white,
                ),
              ),
            )),
        Positioned(
          top: 66.h,
          left: 16.w,
          child: Text(
            '계정연동',
            style: White(14.sp, FontWeight.w600),
          ),
        ),
        Positioned(
            left: 16.w,
            top: 100.h,
            child: Container(
              width: 312,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.3,
                  color: Colors.white,
                ),
              ),
            )),
        Positioned(
          top: 116.h,
          left: 16.w,
          child: Text(
            '비밀번호 변경',
            style: White(14.sp, FontWeight.w600),
          ),
        ),
        Positioned(
            left: 16.w,
            top: 150.h,
            child: Container(
              width: 312,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.3,
                  color: Colors.white,
                ),
              ),
            )),
        Positioned(
          bottom: 116.h,
          left: 16.w,
          child: Text(
            '초대하기',
            style: White(14.sp, FontWeight.w600),
          ),
        ),
        Positioned(
            left: 16.w,
            bottom: 100.h,
            child: Container(
              width: 312,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.3,
                  color: Colors.white,
                ),
              ),
            )),
        Positioned(
          bottom: 66.h,
          left: 16.w,
          child: Text(
            '고객지원',
            style: White(14.sp, FontWeight.w600),
          ),
        ),
        Positioned(
            left: 16.w,
            bottom: 50.h,
            child: Container(
              width: 312,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.3,
                  color: Colors.white,
                ),
              ),
            )),
        Positioned(
          bottom: 16.h,
          left: 16.w,
          child: Text(
            '서비스 정보',
            style: White(14.sp, FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
