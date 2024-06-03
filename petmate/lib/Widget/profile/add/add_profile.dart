import 'dart:io';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/profile/add/profile_card.dart';

class AddProfileWidget extends StatefulWidget {
  const AddProfileWidget({super.key});

  @override
  State<AddProfileWidget> createState() => _AddProfileWidgetState();
}

class _AddProfileWidgetState extends State<AddProfileWidget> {
  List pet = [];

  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  void _modalshow(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x66303030).withOpacity(0.4),
        context: context,
        builder: (context) {
          return Stack(children: [
            Container(
              width: 360,
              height: 172,
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
                width: 360,
                height: 172,
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
                  InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: ProfileCard(
                      petName: '강아지',
                      imgUrl:
                          'assets/image_asset/pet_upload/animal_select (2).png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: ProfileCard(
                      petName: '고양이',
                      imgUrl:
                          'assets/image_asset/pet_upload/animal_select (3).png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: ProfileCard(
                      petName: '토끼',
                      imgUrl:
                          'assets/image_asset/pet_upload/animal_select (4).png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      pet.add('거북이');
                      setState(() {});
                    },
                    child: ProfileCard(
                      petName: '거북이',
                      imgUrl:
                          'assets/image_asset/pet_upload/animal_select (5).png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      pet.add('물고기');
                      setState(() {});
                    },
                    child: ProfileCard(
                      petName: '물고기',
                      imgUrl:
                          'assets/image_asset/pet_upload/animal_select (6).png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      pet.add('새');
                      setState(() {});
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
              height: 160,
              blur: 12,
              elevation: 0,
              borderRadius: BorderRadius.circular(10),
              child: Container(),
            ),
            Opacity(
              opacity: 0.8,
              child: Container(
                margin: EdgeInsets.all(1),
                width: 360,
                height: 160,
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
                  onTap: () => _pickImage(ImageSource.gallery),
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
    return GestureDetector(
      onTap: () {
        _showModal(context);
      },
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: Stack(
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      margin: EdgeInsets.all(8),
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
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: BlurryContainer(
                        blur: 12,
                        elevation: 0,
                        borderRadius: BorderRadius.circular(50),
                        child: Container(),
                      ),
                    ),
                    Opacity(
                      opacity: 0.4,
                      child: Container(
                        margin: EdgeInsets.all(8),
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x26000000),
                                blurRadius: 2,
                                offset: Offset(4, 4),
                                spreadRadius: 0,
                              )
                            ],
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Positioned(
                        left: 16,
                        top: 16,
                        right: 16,
                        child: Image.asset(
                            'assets/image_asset/pet_upload/animal_profile (2).png'))
                  ],
                ),
              ),
              Positioned(
                bottom: 9,
                right: 5,
                child: Stack(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      margin: EdgeInsets.all(2),
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
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: BlurryContainer(
                        blur: 12,
                        elevation: 0,
                        borderRadius: BorderRadius.circular(50),
                        child: Container(),
                      ),
                    ),
                    Opacity(
                      opacity: 0.4,
                      child: Container(
                        margin: EdgeInsets.all(2),
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x26000000),
                                blurRadius: 2,
                                offset: Offset(3, 3),
                                spreadRadius: 0,
                              )
                            ],
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Positioned(
                        left: 6,
                        top: 8,
                        child: Image.asset(
                            'assets/image_asset/pet_upload/camera.png'))
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 52),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: '이름을 알려주세요.*',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.6)),
                ),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white, decorationThickness: 0),
              cursorColor: Colors.white,
              cursorWidth: 2,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 263,
            height: 16,
            child: Opacity(
              opacity: 0.60,
              child: Text('*표시는 필수 항목이에요.',
                  textAlign: TextAlign.center,
                  style: White(12, FontWeight.w500)),
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
