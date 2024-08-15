import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_widget/blue_container.dart';
import 'package:petmate/Widget/custom_widget/circle_container.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';
import 'package:petmate/Widget/small_container.dart';

class WalkTimer extends StatefulWidget {
  const WalkTimer({super.key});

  @override
  State<WalkTimer> createState() => _WalkTimerState();
}

class _WalkTimerState extends State<WalkTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 295.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              GlassContainer(
                width: 344.w,
                height: 124.h,
                color: Colors.white.withOpacity(0.8),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.8),
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderGradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.10, 0.30, 0.40, 0.0],
                ),
                blur: 12,
                borderRadius: BorderRadius.circular(10),
                borderWidth: 1.0,
                elevation: 0,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 10,
                    offset: Offset(2, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              Positioned(
                top: -30,
                left: 10,
                child: CircleContainer(
                  width: 60.w,
                  height: 60.w,
                ),
              ),
              Positioned(
                  top: -20,
                  left: 20,
                  child: Image.asset('assets/image_asset/walk_log/profile.png'))
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              GlassContainer(
                width: 360.w,
                height: 160.h,
                color: Color(0xCC00287C),
                borderGradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.10, 0.30, 0.40, 0.0],
                ),
                blur: 12,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                borderWidth: 1.0,
                elevation: 0,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 4,
                    offset: Offset(2, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              Positioned(
                  left: 8.w,
                  top: 12.h,
                  child: BlueContainer(
                    width: 168.w,
                    height: 52.h,
                  )),
              Positioned(
                  left: 50.w,
                  top: 24.h,
                  child: Image.asset('assets/image_asset/walk_log/note.png')),
              Positioned(
                left: 86.w,
                top: 31.h,
                child: SizedBox(
                  width: 48,
                  child: Text(
                    '메모 추가',
                    style: White(12.sp, FontWeight.w500),
                  ),
                ),
              ),
              Positioned(
                  right: 8.w,
                  top: 12.h,
                  child: BlueContainer(
                    width: 168.w,
                    height: 52.h,
                  )),
              Positioned(
                  right: 106.w,
                  top: 24.h,
                  child: Image.asset('assets/image_asset/walk_log/toilet.png')),
              Positioned(
                right: 50.w,
                top: 31.h,
                child: SizedBox(
                  width: 48,
                  child: Text(
                    '용변 기록',
                    style: White(12.sp, FontWeight.w500),
                  ),
                ),
              ),
              Positioned(
                  left: 8.w,
                  bottom: 20.h,
                  child: BlueContainer(
                    width: 168.w,
                    height: 68.h,
                  )),
              Positioned(
                  left: 39.w,
                  top: 90.h,
                  child: Image.asset('assets/image_asset/walk_log/stop.png')),
              Positioned(
                  right: 8.w,
                  bottom: 20.h,
                  child: BlueContainer(
                    width: 168.w,
                    height: 68.h,
                  )),
              Positioned(
                  right: 111.w,
                  top: 90.h,
                  child: Image.asset('assets/image_asset/walk_log/pause.png')),
              Positioned(
                right: 37.w,
                top: 96.5.h,
                child: SizedBox(
                  width: 58,
                  child: Text(
                    '일시정지',
                    style: White(16.sp, FontWeight.w600),
                  ),
                ),
              ),
              Positioned(
                left: 87.w,
                top: 96.5.h,
                child: SizedBox(
                  width: 58,
                  child: Text(
                    '종료하기',
                    style: White(16.sp, FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
