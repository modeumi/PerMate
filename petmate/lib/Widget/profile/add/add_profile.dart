import 'dart:io';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_widget/circle_container.dart';
import 'package:petmate/Widget/profile/add/profile_card.dart';

class AddProfileWidget extends StatefulWidget {
  const AddProfileWidget({super.key});

  @override
  State<AddProfileWidget> createState() => _AddProfileWidgetState();
}

class _AddProfileWidgetState extends State<AddProfileWidget> {
  List pet = [];
  final picker = ImagePicker();
  File? _image;
  String _PetProfileImag =
      'assets/image_asset/pet_upload/animal_profile (2).png';

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
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
              width: 360.w,
              height: 172.h,
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
            Opacity(
              opacity: 0.4,
              child: Container(
                margin: EdgeInsets.all(1),
                width: 360.w,
                height: 172.h,
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
            Container(
              height: 172,
              child: GridView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 64,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 12.0),
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _PetProfileImag =
                            'assets/image_asset/pet_upload/animal_profile (2).png';
                      });
                    },
                    child: ProfileCard(
                      petName: '강아지',
                      imgUrl:
                          'assets/image_asset/pet_upload/animal_select (2).png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _PetProfileImag =
                            'assets/image_asset/pet_upload/animal_profile (5).png';
                      });
                    },
                    child: ProfileCard(
                      petName: '고양이',
                      imgUrl:
                          'assets/image_asset/pet_upload/animal_select (3).png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _PetProfileImag =
                            'assets/image_asset/pet_upload/animal_profile (6).png';
                      });
                    },
                    child: ProfileCard(
                      petName: '토끼',
                      imgUrl:
                          'assets/image_asset/pet_upload/animal_select (4).png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _PetProfileImag =
                            'assets/image_asset/pet_upload/animal_profile (3).png';
                      });
                    },
                    child: ProfileCard(
                      petName: '거북이',
                      imgUrl:
                          'assets/image_asset/pet_upload/animal_select (5).png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _PetProfileImag =
                            'assets/image_asset/pet_upload/animal_profile (4).png';
                      });
                    },
                    child: ProfileCard(
                      petName: '물고기',
                      imgUrl:
                          'assets/image_asset/pet_upload/animal_select (6).png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _PetProfileImag =
                            'assets/image_asset/pet_upload/animal_profile (1).png';
                      });
                    },
                    child: ProfileCard(
                      petName: '새',
                      imgUrl:
                          'assets/image_asset/pet_upload/animal_select (1).png',
                    ),
                  ),
                ],
              ),
            ),
          ]);
        });
  }

  void _showModal(BuildContext context) {
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
                          'assets/image_asset/pet_upload/animal_select (2).png',
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
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleContainer(
              width: 96.w,
              height: 96.h,
            ),
            Positioned(
                left: 16.w,
                top: 16.h,
                child: _image != null
                    ? Image.file(_image!)
                    : Image.asset(_PetProfileImag)),
            Positioned(
              top: 72.h,
              left: 72.w,
              child: CircleContainer(
                width: 24.w,
                height: 24.h,
              ),
            ),
            Positioned(
                left: 76.w,
                top: 78.h,
                child: GestureDetector(
                  onTap: () {
                    _showModal(context);
                  },
                  child: Image.asset(
                    'assets/image_asset/pet_upload/camera.png',
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
