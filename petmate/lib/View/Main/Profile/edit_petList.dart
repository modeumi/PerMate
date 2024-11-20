import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Main/Profile/deleted_petList.dart';
import 'package:petmate/View/Main/Profile/upload_profile.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/custom_appbar.dart';
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
      body: Container(
          width: 360.w,
          height: 800.h,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Main/Background.png'),
                fit: BoxFit.fill),
          ),
          child: Column(children: [
            CustomAppbar(
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
                    Get.to(() => DeletedPetListPage());
                  },
                  child: Image.asset('assets/alert/delete(24).png'),
                ),
              ],
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                width: 360.w,
                height: 850.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Opacity(
                        opacity: 0.6,
                        child: Text('순서를 수정하면 홈에서 노출되는 순서에 반영됩니다.',
                            style: White(12.sp, FontWeight.w500)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 5),
                      child: Text('내 반려동물',
                          textAlign: TextAlign.center,
                          style: White(16.sp, FontWeight.w600)),
                    ),
                    Center(child: MyPetEditWidget()),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, top: 20, bottom: 5),
                      child: Text('공유받은 반려동물',
                          style: White(16.sp, FontWeight.w600)),
                    ),
                    Center(child: MyPetEditWidget()),
                  ],
                ),
              ),
            ))
          ])),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
