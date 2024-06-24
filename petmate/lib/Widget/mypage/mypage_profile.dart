import 'dart:io';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/circle_container.dart';
import 'package:petmate/Widget/profile/add/profile_card.dart';

class MypageProfile extends StatefulWidget {
  const MypageProfile({super.key});

  @override
  State<MypageProfile> createState() => _MypageProfileState();
}

class _MypageProfileState extends State<MypageProfile> {
  final picker = ImagePicker();
  File? _profileImage;
  String _profileImagePath = 'assets/image_asset/mypage/profile_select (1).png';

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _modalshow(BuildContext context) {
    Navigator.pop(context);
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x66303030).withOpacity(0.4),
        context: context,
        builder: (context) {
          return Stack(children: [
            Container(
              width: 360,
              height: 160,
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                border: GradientBoxBorder(
                  width: 1,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2)
                    ],
                  ),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            BlurryContainer(
              width: double.infinity,
              height: 160.h,
              blur: 12,
              elevation: 0,
              borderRadius: BorderRadius.circular(10),
              child: Container(),
            ),
            Opacity(
              opacity: 0.8,
              child: Container(
                margin: EdgeInsets.all(1),
                width: 360.w,
                height: 160.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 8,
                        offset: Offset(-2, -2),
                        spreadRadius: 0,
                      )
                    ],
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Positioned(
                left: 16,
                top: 16,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _profileImagePath =
                          'assets/image_asset/mypage/profile.png';
                    });
                  },
                  child: Container(
                    width: 156,
                    height: 128,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/image_asset/mypage/profile_select (2).png',
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '남성',
                          style: Black(16, FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                )),
            Positioned(
                right: 16,
                top: 16,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _profileImagePath =
                          'assets/image_asset/mypage/profile.png';
                    });
                  },
                  child: Container(
                    width: 156,
                    height: 128,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/image_asset/mypage/profile_select (1).png',
                          width: 28,
                          height: 42,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '여성',
                          style: Black(16, FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                )),
          ]);
        });
  }

  void _profileModal(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x66303030).withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) {
          return Stack(children: [
            Container(
              width: 360,
              height: 160,
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                border: GradientBoxBorder(
                  width: 1,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2)
                    ],
                  ),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            BlurryContainer(
              width: double.infinity,
              height: 160.h,
              blur: 12,
              elevation: 0,
              borderRadius: BorderRadius.circular(10),
              child: Container(),
            ),
            Opacity(
              opacity: 0.8,
              child: Container(
                margin: EdgeInsets.all(1),
                width: 360.w,
                height: 160.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 8,
                        offset: Offset(-2, -2),
                        spreadRadius: 0,
                      )
                    ],
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Positioned(
                left: 16,
                top: 16,
                child: GestureDetector(
                  onTap: () {
                    _modalshow(context);
                  },
                  child: Container(
                    width: 156,
                    height: 128,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/image_asset/mypage/profile_select (2).png',
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '기본 캐릭터',
                          style: Black(16, FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                )),
            Positioned(
                right: 16,
                top: 16,
                child: GestureDetector(
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                  },
                  child: Container(
                    width: 156,
                    height: 128,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/image_asset/pet_upload/gallery.png',
                          width: 28,
                          height: 42,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '갤러리',
                          style: Black(16, FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                )),
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: CircleContainer(
            width: 126.w,
            height: 126.h,
          ),
        ),
        _profileImage != null
            ? Image.file(
                _profileImage!,
                width: 126.w,
                height: 126.h,
                fit: BoxFit.cover,
              )
            : Image.asset(
                _profileImagePath,
                width: 126.w,
                height: 126.h,
                fit: BoxFit.cover,
              ),
       
        Positioned(
          left: 98.w,
          top: 98.h,
          child: CircleContainer(
            width: 28.w,
            height: 28.h,
          ),
        ),
        Positioned(
          left: 104.w,
          top: 106.h,
          child: GestureDetector(
              onTap: () {
                _profileModal(context);
              },
              child: Image.asset('assets/image_asset/mypage/camera_small.png')),
        ),
      ],
    );
  }
}
