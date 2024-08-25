import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/petprofile_controller.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Main/Profile/deleted_petList.dart';
import 'package:petmate/View/Main/Profile/editpage.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/custom_widget/circle_container.dart';
import 'package:petmate/Widget/profile/details/_type.dart';
import 'package:petmate/Widget/profile/details/details_type.dart';

class EditdetailsPage extends StatefulWidget {
  const EditdetailsPage({super.key});

  @override
  State<EditdetailsPage> createState() => EditdetailsPageState();
}

class EditdetailsPageState extends State<EditdetailsPage> {
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
              CustomAppbar(
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
                      Get.to(() => DeletedPetListPage());
                    },
                    child: Image.asset(
                      'assets/alert/delete(24).png',
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: 360.w,
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleContainer(
                            width: 120.w,
                            height: 120.h,
                          ),
                          Positioned(
                            left: 20.w,
                            top: 20.h,
                            child: Image.asset(
                              'assets/image_asset/edit/Image.png',
                            ),
                          ),
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
                        height: 65,
                      ),
                      DetailsAddWidget(),
                      SizedBox(
                        height: 75,
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar());
  }
}
