import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Invite/public_mate.dart';
import 'package:petmate/View/Notice/notice.dart';
import 'package:petmate/View/Alarm/alarm.dart';

class MainAlram extends StatefulWidget {
  const MainAlram({super.key});

  @override
  State<MainAlram> createState() => _MainAlramState();
}

class _MainAlramState extends State<MainAlram> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: GestureDetector(
        onTap: () {
          Get.to(() => AlarmPage());
        },
        child: Container(
          width: 354.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GlassContainer(
                width: 200.w,
                height: 40.h,
                color: Color(0xff00297C).withOpacity(0.2),
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.white.withOpacity(0.2),
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
                borderRadius: BorderRadius.circular(20.r),
                borderWidth: 1.w,
                elevation: 0,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 2,
                    offset: Offset(2, 2),
                  )
                ],
                shadowColor: Color(0x26000000),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 12.w,
                    ),
                    Image.asset('assets/Main/Clock.png'),
                    SizedBox(
                      width: 8.w,
                    ),
                    Opacity(
                      opacity: 0.6,
                      child: Text(
                        '알람 등록시 표시됩니다.',
                        style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: 14.sp,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              GlassContainer(
                  width: 40.w,
                  height: 40.h,
                  color: Color(0xff00297C).withOpacity(0.2),
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.white.withOpacity(0.2)],
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
                  borderRadius: BorderRadius.circular(20.r),
                  borderWidth: 1.w,
                  elevation: 0,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    )
                  ],
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/Main/Fire.png",
                        ),
                        Text(
                          '0',
                          style: White(10.sp, FontWeight.w500),
                        ),
                      ],
                    ),
                  )),
              GlassContainer(
                  width: 40.w,
                  height: 40.h,
                  color: Color(0xff00297C).withOpacity(0.2),
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.white.withOpacity(0.2)],
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
                  borderRadius: BorderRadius.circular(20.r),
                  borderWidth: 1.w,
                  elevation: 0,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    )
                  ],
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => PublicMate());
                    },
                    child: Image.asset(
                      "assets/Main/invite.png",
                    ),
                  )),
              GlassContainer(
                  width: 40.w,
                  height: 40.h,
                  color: Color(0xff00297C).withOpacity(0.2),
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.white.withOpacity(0.2)],
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
                  borderRadius: BorderRadius.circular(20.r),
                  borderWidth: 1.w,
                  elevation: 0,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    )
                  ],
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => NoticePage());
                    },
                    child: Image.asset(
                      "assets/Main/notification.png",
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
