import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Notice/noticedelete.dart';
import 'package:petmate/View/mainpage.dart';
import 'package:petmate/Widget/bottom_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/notice/notification_type.dart';
import 'package:petmate/Widget/notice/notificationcontainer2.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 360.w,
        height: 850.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Main/Background.png'),
              fit: BoxFit.fill),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Container(
                    width: 360.w,
                    height: 45.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset('assets/alert/back.png')),
                        Text('알림',
                            textAlign: TextAlign.center,
                            style: White(20.sp, FontWeight.w600)),
                        GestureDetector(
                          onTap: () {
                            Get.to(NoticeDeleted());
                          },
                          child: Image.asset('assets/alert/delete(24).png'),
                        ),
                      ],
                    ),
                  ),
                ),
                NotificationWidget(),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          NotificationContainer1(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomBottomNavigationBar())
          ],
        ),
      ),
    );
  }
}
