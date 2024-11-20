import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_widget/circle_container.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class MyInfomation extends StatefulWidget {
  const MyInfomation({super.key});

  @override
  State<MyInfomation> createState() => _MyInfomationState();
}

class _MyInfomationState extends State<MyInfomation> {
  Map<String, dynamic> list = {
    '이메일(아이디)': 'example@example.com',
    '이름': '김이름',
    '성별': '남성',
    '생년월일': '1996.01.01',
    '가입일': '2023.04.01',
  };

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 102.h,
          left: 117.w,
          child: CircleContainer(
            width: 126.w,
            height: 126.h,
          ),
        ),
        Positioned(
          top: 102.h,
          left: 117.w,
          child: Image.asset('assets/image_asset/mypage/profile.png'),
        ),
        Positioned(
          top: 240.h,
          left: 142.w,
          child: Text(
            '닉네임 님',
            style: White(20.sp, FontWeight.w600),
          ),
        ),
        Positioned(
          top: 296.h,
          left: 8.w,
          child: CustomContainer(
            width: 344.w,
            height: 428.h,
            color: Color(0x3300287C),
            shadow_color: Color(0x4C000000),
          ),
        ),
        ...list.entries.map((entry) {
          int index = list.keys.toList().indexOf(entry.key);
          return Positioned(
            top: 308.h + (index * 84.h),
            left: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key,
                  style: White(14.sp, FontWeight.w600),
                ),
                SizedBox(height: 8.h),
                GlassContainer(
                  width: 320.w,
                  height: 40.h,
                  color: Color(0x3300287C),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.10, 0.60, 0.40, 0.0],
                  ),
                  blur: 12,
                  borderRadius: BorderRadius.circular(10.r),
                  borderWidth: 1.0,
                  elevation: 0,
                  child: Center(
                    child: Text(
                      entry.value,
                      style: White(14.sp, FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
