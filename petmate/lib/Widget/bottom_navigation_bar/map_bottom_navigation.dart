import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/navigation_controller.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Community/community_main.dart';
import 'package:petmate/View/Log/logmain.dart';
import 'package:petmate/View/Map/naver_map.dart';
import 'package:petmate/View/MyPage/mypage.dart';
import 'package:petmate/View/Main/mainpage.dart';

class MapBottomNavigationBar extends GetView<BottomNavigationBarController> {
  const MapBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Container(
              width: 360.w,
              height: 64.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.20000000298023224),
                border: Border(
                  top: BorderSide(
                      color: Colors.white.withOpacity(0.20000000298023224),
                      width: 1),
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: BlurryContainer(
                blur: 12,
                elevation: 0,
                borderRadius: BorderRadius.circular(10.r),
                child: Container(),
              ),
            ),
            Opacity(
              opacity: 0.2,
              child: Container(
                width: 360.w,
                height: 64.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 2,
                        offset: Offset(2, 2),
                        spreadRadius: 0,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Container(
              width: 360.w,
              height: 62.h,
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                currentIndex: controller.selectedIndex.value,
                unselectedItemColor: Color(0xFFB7B7B7),
                selectedItemColor: Color(0xFF5A8FE1),
                unselectedLabelStyle: White(10.sp, FontWeight.w500),
                selectedLabelStyle: White(10.sp, FontWeight.w600),
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 0
                        ? Image.asset(
                            'assets/gnbicon/home (2).png',
                            height: 30.h,
                            width: 24.w,
                          )
                        : Image.asset(
                            'assets/gnbicon(map)/gnbicon (4).png',
                            height: 30.h,
                            width: 24.w,
                          ),
                    label: "홈",
                  ),
                  BottomNavigationBarItem(
                      icon: controller.selectedIndex.value == 1
                          ? Image.asset(
                              'assets/gnbicon/record (2).png',
                              height: 30.h,
                              width: 24.w,
                            )
                          : Image.asset(
                              'assets/gnbicon(map)/gnbicon (5).png',
                              height: 30.h,
                              width: 24.w,
                            ),
                      label: "기록"),
                  BottomNavigationBarItem(
                      icon: controller.selectedIndex.value == 2
                          ? Image.asset(
                              'assets/gnbicon(map)/gnbicon (1).png',
                              height: 30.h,
                              width: 24.w,
                            )
                          : Image.asset(
                              'assets/gnbicon/map.png',
                              height: 30.h,
                              width: 24.w,
                            ),
                      label: "지도"),
                  BottomNavigationBarItem(
                      icon: controller.selectedIndex.value == 3
                          ? Image.asset(
                              'assets/gnbicon/chat (2).png',
                              height: 30.h,
                              width: 24.w,
                            )
                          : Image.asset(
                              'assets/gnbicon(map)/gnbicon (3).png',
                              height: 30.h,
                              width: 24.w,
                            ),
                      label: "커뮤니티"),
                  BottomNavigationBarItem(
                      icon: controller.selectedIndex.value == 4
                          ? Image.asset(
                              'assets/gnbicon/user (2).png',
                              height: 30.h,
                              width: 24.w,
                            )
                          : Image.asset(
                              'assets/gnbicon(map)/gnbicon (2).png',
                              height: 30.h,
                              width: 24.w,
                            ),
                      label: "마이페이지"),
                ],
                onTap: (index) {
                  controller.changeIndex(index);
                  switch (index) {
                    case 0:
                      Get.to(() => MainPage());
                      break;
                    case 1:
                      Get.to(() => LogMain());
                      break;
                    case 2:
                      Get.to(() => MNaverMap());
                      break;
                    case 3:
                      Get.to(() => CommunityMain());
                      break;
                    case 4:
                      Get.to(() => Mypage());
                      break;
                    default:
                  }
                },
              ),
            ),
          ],
        ));
  }
}

class BottomWidget extends StatelessWidget {
  static List<Widget> tabPages = <Widget>[
    const MainPage(),
    const LogMain(),
    const MNaverMap(),
    const CommunityMain(),
    const Mypage()
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavigationBarController());
    return Scaffold(
      body: Obx(() => SafeArea(
          child:
              tabPages[BottomNavigationBarController.to.selectedIndex.value])),
      bottomNavigationBar: MapBottomNavigationBar(),
    );
  }
}
