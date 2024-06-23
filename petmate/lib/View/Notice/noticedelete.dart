import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/bottom_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/button/deleted_button.dart';
import 'package:petmate/Widget/notice/NotificationContainer2.dart';
import 'package:petmate/Widget/notice/noticfication_check_deleted.dart';
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/notice/notification_type.dart';

class NoticeDeleted extends StatefulWidget {
  const NoticeDeleted({super.key});

  @override
  State<NoticeDeleted> createState() => _NoticeDeletedState();
}

class _NoticeDeletedState extends State<NoticeDeleted> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:360.w,
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
                          child: Image.asset('assets/alert/back.png'),
                        ),
                        Text('알림',
                            textAlign: TextAlign.center,
                            style: White(20.sp, FontWeight.w600)),
                        GestureDetector(
                          child: Image.asset('assets/alert/delete(24).png'),
                        ),
                      ],
                    ),
                  ),
                ),
                NotificationWidget(),
                Expanded(
                  child: ListView(
                    children: [
                      NotificationCheckDeleted(),
                      NotificationCheckDeleted(),
                      NotificationCheckDeleted(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(bottom: 75, left: 10, child: DeletedButtonWidget()),
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
