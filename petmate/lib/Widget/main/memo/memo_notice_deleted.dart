import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Notice/noticedelete.dart';
import 'package:petmate/View/mainpage.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/button/deletedbutton/memo_deleted_button.dart';
import 'package:petmate/Widget/button/deletedbutton/sharedeleted_button.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/main/memo/memo_deleted.dart';
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/notice/notification_type.dart';
import 'package:petmate/Widget/profile/deleted/mypet_deleted_widget.dart';
import 'package:petmate/Widget/profile/deleted/mypet_edit_widget.dart';

class MemoNoticeDeleted extends StatefulWidget {
  const MemoNoticeDeleted({super.key});

  @override
  State<MemoNoticeDeleted> createState() => _MemoNoticeDeletedState();
}

class _MemoNoticeDeletedState extends State<MemoNoticeDeleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: '수정하기',
        action: [
          GestureDetector(
            onTap: () {},
            child: Image.asset('assets/edit/plus.png'),
          ),
          SizedBox(
            width: 8.w,
          ),
          GestureDetector(
            onTap: () {},
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
            Positioned(
              top: 98.h,
              left: 58.w,
              child: Opacity(
                opacity: 0.6,
                child: Text(
                  '순서를 수정하면 홈에서 노출되는 순서에 반영됩니다.',
                  style: White(12.sp, FontWeight.w500),
                ),
              ),
            ),

            Positioned(top: 124.h, left: 8.w, child: MemoDeleted()),

            // Expanded(
            //   child: NotificationListener(
            //     child: ListView(
            //       children: [
            //         MyPetDeletedWidget(),
            //       ],
            //     ),
            //   ),
            // ),
            Positioned(bottom: 75, left: 10, child: MemoDeletedButton()),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
