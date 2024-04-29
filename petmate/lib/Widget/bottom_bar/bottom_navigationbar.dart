import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:petmate/Controller/navigation_controller.dart';
import 'package:petmate/View/Map/naver_map.dart';
import 'package:petmate/View/mainpage.dart';

class CustomBottomNavigationBar extends GetView<BottomNavigationBarController> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool state2 = false;

    return Obx(() => Stack(
          children: [
            Container(
              width: double.infinity,
              height: 64,
              decoration: BoxDecoration(
                color:
                    state2 ? Colors.white.withOpacity(0.2) : Colors.transparent,
                border: GradientBoxBorder(
                  width: 1,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2)
                    ],
                  ),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: state2
                  ? Container()
                  : BlurryContainer(
                      blur: 12,
                      elevation: 0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(),
                    ),
            ),
            Opacity(
              opacity: 0.4,
              child: Container(
                width: double.infinity,
                height: 64,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 1,
                        offset: Offset(1, 1),
                        spreadRadius: 0,
                      )
                    ],
                    color: Color(0x3300287C),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              currentIndex: controller.selectedIndex.value,
              unselectedItemColor: Color(0xFFD8E3F4),
              selectedItemColor: Colors.white,
              unselectedLabelStyle: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              selectedLabelStyle: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: controller.selectedIndex.value == 0
                      ? Image.asset('assets/gnbicon/home (2).png')
                      : Image.asset('assets/gnbicon/home (1).png'),
                  label: "홈",
                ),
                BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 1
                        ? Image.asset('assets/gnbicon/record (2).png')
                        : Image.asset('assets/gnbicon/record (1).png'),
                    label: "기록"),
                BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 2
                        ? Image.asset('assets/gnbicon(map)/gnbicon (1).png')
                        : Image.asset('assets/gnbicon/map.png'),
                    label: "지도"),
                BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 3
                        ? Image.asset('assets/gnbicon/chat (2).png')
                        : Image.asset('assets/gnbicon/chat (1).png'),
                    label: "커뮤니티"),
                BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 4
                        ? Image.asset('assets/gnbicon/user (2).png')
                        : Image.asset('assets/gnbicon/user (1).png'),
                    label: "마이페이지"),
              ],
              onTap: (index) {
                controller.changeIndex(index);
                switch (index) {
                  case 0:
                    Get.to(() => MainPage());
                    break;
                  case 1:
                    // Get.to(() => Log());
                    break;
                  case 2:
                    Get.to(() => MNaverMap());
                    break;
                  case 3:
                    // Get.to(() => Community());
                    break;
                  case 4:
                    // Get.to(() => MyPage());
                    break;
                  default:
                }
              },
            ),
          ],
        ));
  }
}

class BottomWidget extends StatelessWidget {
  static List<Widget> tabPages = <Widget>[MainPage(), MNaverMap()];

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavigationBarController());
    return Scaffold(
      body: Obx(() => SafeArea(
          child:
              tabPages[BottomNavigationBarController.to.selectedIndex.value])),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
