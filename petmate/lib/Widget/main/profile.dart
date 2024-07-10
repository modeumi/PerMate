import 'dart:async';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Main/Profile/edit_pet_list.dart';
import 'package:petmate/View/Main/Profile/upload_profile.dart';

class ProfilePlus extends StatefulWidget {
  const ProfilePlus({super.key});

  @override
  State<ProfilePlus> createState() => _ProfilePlusState();
}

class _ProfilePlusState extends State<ProfilePlus> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 344.w,
        child: Row(
          children: [
            Column(
              children: [
                GlassContainer(
                    width: 60.w,
                    height: 60.h,
                    color: Color(0xff00297C).withOpacity(0.2),
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.white.withOpacity(0.2)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderGradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.2),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.10, 0.30, 0.40, 0.0],
                    ),
                    blur: 12,
                    borderRadius: BorderRadius.circular(50.r),
                    borderWidth: 1,
                    elevation: 0,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 2,
                        offset: Offset(2, 2),
                      )
                    ],
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => UploadProfilePage());
                      },
                      child: Image.asset('assets/Main/add.png'),
                    )),
                Text('추가하기',
                    textAlign: TextAlign.center,
                    style: White(12.sp, FontWeight.w500)),
              ],
            ),
            Container(
              child: Column(
                children: [
                  GlassContainer(
                      width: 60.w,
                      height: 60.h,
                      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                      color: Color(0xff00297C).withOpacity(0.2),
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.white.withOpacity(0.2)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderGradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0.2),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.10, 0.30, 0.40, 0.0],
                      ),
                      blur: 12,
                      borderRadius: BorderRadius.circular(50.r),
                      borderWidth: 1,
                      elevation: 0,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 2,
                          offset: Offset(2, 2),
                        )
                      ],
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => EditPetListPage());
                        },
                        child: Image.asset('assets/Main/edit.png'),
                      )),
                  Text('수정하기',
                      textAlign: TextAlign.center,
                      style: White(12.sp, FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
