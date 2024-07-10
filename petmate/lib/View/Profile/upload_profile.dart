import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/profile/add/add_info.dart';
import 'package:petmate/Widget/profile/add/add_name.dart';
import 'package:petmate/Widget/profile/add/add_profile.dart';

class UploadProfilePage extends StatefulWidget {
  const UploadProfilePage({super.key});

  @override
  State<UploadProfilePage> createState() => _UploadProfilePage();
}

class _UploadProfilePage extends State<UploadProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
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
              automaticallyImplyLeading: false,
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
                '등록',
                style: White(20.sp, FontWeight.w600),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  AddProfileWidget(),
                  AddName(),
                  AddInfoWidget(),
                  SizedBox(
                    height: 75,
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
