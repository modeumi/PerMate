import 'dart:async';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Profile.dart/edit_profile.dart';
import 'package:petmate/View/Profile.dart/add_profile.dart';

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
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    width: 60,
                    height: 60,
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
                InkWell(
                  onTapDown: (_) {
                    setState(() {
                      state1 = true;
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      state1 = false;
                    });
                    Get.to(() => AddProfilePage());
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 2),
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
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('assets/edit/plus.png'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -23,
                  left: 11,
                  child: Text('추가하기',
                      textAlign: TextAlign.center,
                      style: White(12, FontWeight.w500)),
                ),
              ],
            ),
            SizedBox(
              width: 8,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    width: 60,
                    height: 60,
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
                InkWell(
                  onTapDown: (_) {
                    setState(() {
                      state2 = true;
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      state2 = false;
                    });
                    Get.to(() => EditProfilePage());
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 2),
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
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('assets/Main/edit.png'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -23,
                  left: 11,
                  child: Text('수정하기',
                      textAlign: TextAlign.center,
                      style: White(12, FontWeight.w500)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
