import 'dart:async';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Profile/edit_pet_list.dart';
import 'package:petmate/View/Profile/upload_profile.dart';

class ProfilePlus extends StatefulWidget {
  const ProfilePlus({super.key});

  @override
  State<ProfilePlus> createState() => _ProfilePlusState();
}

class _ProfilePlusState extends State<ProfilePlus> {
  bool state1 = false;
  bool state2 = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => UploadProfilePage());
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: state1
                          ? Colors.white.withOpacity(0.1)
                          : Colors.transparent,
                      border: GradientBoxBorder(
                        width: 1,
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2)
                          ],
                        ),
                      ),
                    ),
                    child: BlurryContainer(
                      blur: 12,
                      elevation: 0,
                      borderRadius: BorderRadius.circular(50.r),
                      child: Image.asset('assets/Main/add.png'),
                    ),
                  ),
                  Opacity(
                    opacity: 0.4,
                    child: Container(
                      width: 60.w,
                      height: 60.h,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: Color(0x26000000),
                            offset: Offset(2, 2),
                          )
                        ],
                        color: Color(0x3300287C),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    left: 11,
                    child: Text('추가하기',
                        textAlign: TextAlign.center,
                        style: White(12.sp, FontWeight.w500)),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => EditPetListPage());
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: state2
                          ? Colors.white.withOpacity(0.1)
                          : Colors.transparent,
                      border: GradientBoxBorder(
                        width: 1,
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2)
                          ],
                        ),
                      ),
                    ),
                    child: BlurryContainer(
                      blur: 12,
                      elevation: 0,
                      borderRadius: BorderRadius.circular(50.r),
                      child: Image.asset('assets/Main/edit.png'),
                    ),
                  ),
                  Opacity(
                    opacity: 0.4,
                    child: Container(
                      width: 60.w,
                      height: 60.h,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x26000000),
                            offset: Offset(2, 2),
                          )
                        ],
                        color: Color(0x3300287C),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    left: 11,
                    child: Text('수정하기',
                        textAlign: TextAlign.center,
                        style: White(12.sp, FontWeight.w500)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
