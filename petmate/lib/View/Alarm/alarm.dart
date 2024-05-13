import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Alarm/alarm_add.dart';
import 'package:petmate/View/Alarm/alarm_deleted.dart';
import 'package:petmate/Widget/aralam/alarm_control.dart';
import 'package:petmate/Widget/bottom_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/profile/deleted/mypet_deleted_widget.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  bool state2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 850,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Main/Background.png'),
              fit: BoxFit.fill),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset('assets/alert/back.png')),
                        Container(
                          width: 1,
                        ),
                        Text('알람',
                            textAlign: TextAlign.center,
                            style: White(20, FontWeight.w600)),
                        Container(
                          width: 88,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => AlarmAddPage());
                                },
                                child: Image.asset('assets/Main/add.png'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => AlarmDeletedPage());
                                },
                                child:
                                    Image.asset('assets/alert/delete(24).png'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Text(
                    '켜져있는 알람이 홈 화면 상단에 노출됩니다.',
                    style: White(12, FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: NotificationListener(
                    child: ListView(
                      children: [AlarmControlWidget()],
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
