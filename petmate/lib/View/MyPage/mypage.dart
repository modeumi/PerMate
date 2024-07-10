import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Controller/navigation_controller.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Invite/get_invite.dart';
import 'package:petmate/View/Invite/invite.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/button/delet_button.dart';
import 'package:petmate/Widget/custom_widget/circle_container.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';
import 'package:petmate/Widget/mypage/mypage_info.dart';
import 'package:petmate/Widget/mypage/mypage_profile.dart';
import 'package:petmate/Widget/mypage/mypage_write.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  final BottomNavigationBarController _bottomNavigationBarController =
      Get.put(BottomNavigationBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
              top: 190.h,
              left: 143.w,
              child: Container(
                width: 75.w,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '닉네임 님',
                    hintStyle: White(20.sp, FontWeight.w600),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.white.withOpacity(0.6)),
                    ),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white, decorationThickness: 0),
                  cursorColor: Colors.white,
                  cursorWidth: 2,
                ),
              ),
            ),
            Positioned(
                top: 212.h,
                left: 225.w,
                child: Image.asset('assets/image_asset/mypage/edit.png')),
            Positioned(top: 74.h, left: 118.w, child: MypageProfile()),
            Positioned(top: 268.h, left: 8.w, child: MypageWrite()),
            Positioned(top: 352.h, left: 8.w, child: MypageInfo()),
            Positioned(
                top: 645.h,
                left: 8.w,
                child: DeletButton(content: '로그아웃', action: () {})),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
