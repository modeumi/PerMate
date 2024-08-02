import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/petprofile_controller.dart';
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
  PetprofileController petprofileController = Get.put(PetprofileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        width: 360.w,
        height: 800.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Main/Background.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            CustomAppbar(title: '등록'),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    AddProfileWidget(),
                    SizedBox(
                      height: 10.h,
                    ),
                    AddName(),
                    SizedBox(
                      height: 40.h,
                    ),
                    AddInfoWidget(),
                    SizedBox(
                      height: 75.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
