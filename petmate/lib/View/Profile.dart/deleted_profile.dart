import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Notice/noticedelete.dart';
import 'package:petmate/View/mainpage.dart';
import 'package:petmate/Widget/bottom_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/button/deleted_button.dart';
import 'package:petmate/Widget/button/sharedeleted_button.dart';
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/notice/notification_type.dart';
import 'package:petmate/Widget/profile/deleted/mypet_deleted_widget.dart';
import 'package:petmate/Widget/profile/deleted/mypet_edit_widget.dart';
import 'package:petmate/Widget/profile/deleted/sharepet_deleted_widget.dart';

class DeletedProfilePage extends StatefulWidget {
  const DeletedProfilePage({super.key});

  @override
  State<DeletedProfilePage> createState() => _DeletedProfilePageState();
}

class _DeletedProfilePageState extends State<DeletedProfilePage> {
  bool state = false;

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
                        Text('수정하기',
                            textAlign: TextAlign.center,
                            style: White(20, FontWeight.w600)),
                        Container(
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Image.asset('assets/Main/add.png'),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () {},
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
                    '순서를 수정하면 홈에서 노출되는 순서에 반영됩니다.',
                    style: White(12, FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: NotificationListener(
                    child: ListView(
                      children: [
                        MyPetDeletedWidget(),
                        SharePetDeletedWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(bottom: 75, left: 10, child: ShareDeletedButtonWidget()),
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
