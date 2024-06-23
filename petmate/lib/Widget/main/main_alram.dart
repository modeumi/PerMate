import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
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
      padding: const EdgeInsets.only(top: 40, bottom: 5, left: 3),
      child: GestureDetector(
        onTap: () {
          Get.to(() => AlarmPage());
        },
        child: Container(
          width: 354.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Container(
                    width: 200.w,
                    height: 40.h,
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      border: GradientBoxBorder(
                        width: 1,
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2)
                          ],
                        ),
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: BlurryContainer(
                      blur: 12,
                      elevation: 0,
                      borderRadius: BorderRadius.circular(20.r),
                      child: Container(),
                    ),
                  ),
                  Opacity(
                    opacity: 0.4,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      width: 200.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 2,
                              offset: Offset(2, 2),
                            )
                          ],
                          color: Color(0x3300287C),
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      width: 175.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/Main/Clock.png'),
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
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      border: GradientBoxBorder(
                        width: 1,
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.20000000298023224)
                          ],
                        ),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Opacity(
                    opacity: 0.4,
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 2,
                              offset: Offset(2, 2),
                            )
                          ],
                          color: Color(0x3300287C),
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                  ),
                  Positioned(
                      left: 15,
                      top: 7,
                      child: GestureDetector(
                        onTap: () {},
                        child: Column(
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
                      ))
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      border: GradientBoxBorder(
                        width: 1,
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.20000000298023224)
                          ],
                        ),
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  Opacity(
                    opacity: 0.4,
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 2,
                              offset: Offset(2, 2),
                            )
                          ],
                          color: Color(0x3300287C),
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                  ),
                  Positioned(
                      left: 13,
                      top: 10,
                      child: GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/Main/invite.png",
                            ),
                          ],
                        ),
                      ))
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      border: GradientBoxBorder(
                        width: 1,
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.20000000298023224)
                          ],
                        ),
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  Opacity(
                    opacity: 0.4,
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 2.r,
                              offset: Offset(2, 2),
                            )
                          ],
                          color: Color(0x3300287C),
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                  ),
                  Positioned(
                      left: 12,
                      top: 10,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => NoticePage());
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/Main/notification.png",
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
