import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Notice/noticedelete.dart';
import 'package:petmate/View/Profile.dart/add_profile.dart';
import 'package:petmate/View/Profile.dart/deleted_profile.dart';
import 'package:petmate/View/mainpage.dart';
import 'package:petmate/Widget/bottom_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/notice/notification_type.dart';
import 'package:petmate/Widget/profile/add/add_info.dart';
import 'package:petmate/Widget/profile/add/add_profile.dart';
import 'package:petmate/Widget/profile/deleted/mypet_edit_widget.dart';
import 'package:petmate/Widget/profile/deleted/sharepet_edit_widget.dart';
import 'package:petmate/Widget/profile/details/details_type.dart';
import 'package:petmate/Widget/profile/details/details_widget.dart';

class EditdetailsPage extends StatefulWidget {
  const EditdetailsPage({super.key});

  @override
  State<EditdetailsPage> createState() => _EditdetailsPageState();
}

class _EditdetailsPageState extends State<EditdetailsPage> {
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => AddProfilePage());
                                },
                                child: Image.asset(
                                    'assets/image_asset/pet_information_details/edit.png'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => DeletedProfilePage());
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
                Expanded(
                  child: NotificationListener(
                    child: ListView(
                      children: [
                        DetailsProfileWidget(),
                        DetailsAddWidget(),
                      ],
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
