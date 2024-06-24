import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Notice/noticedelete.dart';
import 'package:petmate/View/mainpage.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/notice/notification_type.dart';
import 'package:petmate/Widget/profile/add/add_info.dart';
import 'package:petmate/Widget/profile/add/add_name.dart';
import 'package:petmate/Widget/profile/add/add_profile.dart';
import 'package:petmate/Widget/profile/deleted/mypet_deleted_widget.dart';
import 'package:petmate/Widget/profile/deleted/mypet_edit_widget.dart';

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
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(title: '등록'),
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
            Positioned(top: 102.h, left: 132.w, child: AddProfileWidget()),
            Positioned(top: 218.h, left: 55.w, child: AddName()),
            Positioned(top: 302.h, left: 8.w, child: AddInfoWidget())
          ],
        ),
        // child: Expanded(
        //   child: ListView(
        //     children: [],
        //   ),
        // ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
