import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Notice/noticedelete.dart';
import 'package:petmate/View/Profile/upload_profile.dart';
import 'package:petmate/View/Profile/deleted_profile.dart';
import 'package:petmate/View/Profile/editpage.dart';
import 'package:petmate/View/mainpage.dart';

import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/circle_container.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/notice/notification_type.dart';
import 'package:petmate/Widget/profile/add/add_info.dart';
import 'package:petmate/Widget/profile/add/add_profile.dart';
import 'package:petmate/Widget/profile/deleted/mypet_edit_widget.dart';

import 'package:petmate/Widget/profile/details/details_type.dart';

class EditdetailsPage extends StatefulWidget {
  const EditdetailsPage({super.key});

  @override
  State<EditdetailsPage> createState() => _EditdetailsPageState();
}

class _EditdetailsPageState extends State<EditdetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: '수정하기',
        action: [
          GestureDetector(
            onTap: () {
              Get.to(() => EditPage());
            },
            child: Image.asset(
              'assets/image_asset/pet_information_details/edit.png',
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => DeletedProfilePage());
            },
            child: Image.asset(
              'assets/alert/delete(24).png',
            ),
          ),
        ],
      ),
      body: Container(
        width: 360.w,
        height: 800.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Main/Background.png'),
              fit: BoxFit.fill),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 120.w,
              top: 114.h,
              child: CircleContainer(
                width: 120.w,
                height: 120.h,
              ),
            ),
            Positioned(
                left: 140.w,
                top: 134.h,
                child: Image.asset(
                  'assets/image_asset/edit/Image.png',
                )),
            Positioned(
              top: 250.h,
              left: 144.w,
              child: Container(
                child: Text(
                  '복실복실해',
                  style: White(16.sp, FontWeight.w600),
                ),
              ),
            ),
            Positioned(
              top: 260.h,
              bottom: 0,
              left: 0,
              right: 0,
              child: ListView(
                children: [
                  DetailsAddWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
