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
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/notice/notification_type.dart';
import 'package:petmate/Widget/profile/deleted/mypet_edit_widget.dart';

class EditPetListPage extends StatefulWidget {
  const EditPetListPage({super.key});

  @override
  State<EditPetListPage> createState() => _EditPetListPageState();
}

class _EditPetListPageState extends State<EditPetListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: '수정하기',
        action: [
          GestureDetector(
            onTap: () {
              Get.to(() => UploadProfilePage());
            },
            child: Image.asset('assets/edit/plus.png'),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => DeletedProfilePage());
            },
            child: Image.asset('assets/alert/delete(24).png'),
          ),
        ],
      ),
      body: Container(
        width: 360.w,
        height: 850.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Main/Background.png'),
              fit: BoxFit.fill),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 98.h,
              left: 58.w,
              child: Opacity(
                opacity: 0.6,
                child: Text('순서를 수정하면 홈에서 노출되는 순서에 반영됩니다.',
                    style: White(12.sp, FontWeight.w500)),
              ),
            ),
            Positioned(
              top: 132.h,
              left: 12.w,
              child: Text('내 반려동물',
                  textAlign: TextAlign.center,
                  style: White(16.sp, FontWeight.w600)),
            ),
            Positioned(top: 159.h, left: 8.w, child: MyPetEditWidget()),
            Positioned(
                top: 435.h,
                left: 12.w,
                child: Text('공유받은 반려동물', style: White(16.sp, FontWeight.w600))),
            Positioned(top: 462.h, left: 8.w, child: MyPetEditWidget()),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
