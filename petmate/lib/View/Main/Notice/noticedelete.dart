import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/button/deletedbutton/notice_deleted_button.dart';
import 'package:petmate/Widget/custom_appbar.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: '알림',
       
        action: [
          Spacer(),
          GestureDetector(
            onTap: () {
              Get.to(NoticeDeleted());
            },
            child: Image.asset('assets/alert/delete(24).png'),
          ),
        ],
      ),
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
                  height: 60,
                ),
                NotificationWidget(),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(1000, (index) {
                          return NotificationCheckDeleted();
                        })),
                  ),
                ),
              ],
            ),
            Positioned(bottom: 75, left: 10, child: NoticeDeletedButton()),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
