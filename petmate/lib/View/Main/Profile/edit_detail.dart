import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Main/Notice/noticedelete.dart';
import 'package:petmate/View/Main/Profile/upload_profile.dart';
import 'package:petmate/View/Main/Profile/deleted_profile.dart';
import 'package:petmate/View/Main/Profile/editpage.dart';
import 'package:petmate/View/Main/mainpage.dart';

import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/custom_widget/circle_container.dart';
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
      body: Container(
        width: 360.w,
        height: 800.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Main/Background.png'),
              fit: BoxFit.fill),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              scrolledUnderElevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  'assets/onboarding/icon_5.png',
                ),
              ),
              title: Text(
                '수정하기',
                style: White(20.sp, FontWeight.w600),
              ),
              actions: [
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/alert/delete(24).png',
                    ),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: CircleContainer(
                          width: 120.w,
                          height: 120.h,
                        ),
                      ),
                      Positioned(
                          left: 20.w,
                          top: 20.h,
                          child: Image.asset(
                            'assets/image_asset/edit/Image.png',
                          )),
                      Positioned(
                        left: 25.w,
                        top: 136.h,
                        child: Container(
                          child: Text(
                            '복실복실해',
                            style: White(16.sp, FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 68.h,
                  ),
                  DetailsAddWidget(),
                  SizedBox(
                    height: 60.h,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
