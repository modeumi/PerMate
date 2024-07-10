import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Invite/get_invite.dart';
import 'package:petmate/View/Invite/invite.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/custom_widget/circle_container.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class PublicMate extends StatefulWidget {
  const PublicMate({super.key});

  @override
  State<PublicMate> createState() => _PublicMateState();
}

class _PublicMateState extends State<PublicMate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: '공동메이트',
      ),
      body: Container(
        width: 360.w,
        height: 800.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Main/Background.png'),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            Positioned(
              top: 106.h,
              left: 99.w,
              child: CircleContainer(
                width: 162.w,
                height: 162.h,
              ),
            ),
            Positioned(
                top: 106.h,
                left: 99.w,
                child: Image.asset('assets/image_asset/invite/invite.png')),
            Positioned(
              top: 312.h,
              left: 8.w,
              child: GestureDetector(
                  onTap: () {
                    Get.to(() => InvitePage());
                  },
                  child: CustomContainer(
                    width: 344.w,
                    height: 200.h,
                  )),
            ),
            Positioned(
                top: 367.h,
                left: 140.w,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => InvitePage());
                  },
                  child: Container(
                    height: 91.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/image_asset/invite/send.png'),
                        Text(
                          '초대하기',
                          style: White(20.sp, FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                )),
            Positioned(
              top: 524.h,
              left: 8.w,
              child: GestureDetector(
                  onTap: () {
                    Get.to(() => GetInvite());
                  },
                  child: CustomContainer(
                    width: 344.w,
                    height: 200.h,
                  )),
            ),
            Positioned(
                top: 573.h,
                left: 140.w,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => GetInvite());
                  },
                  child: Container(
                    height: 102.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/image_asset/invite/receive.png'),
                        Text(
                          '초대받기',
                          style: White(20.sp, FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
