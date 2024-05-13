import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class AddProfileWidget extends StatefulWidget {
  const AddProfileWidget({super.key});

  @override
  State<AddProfileWidget> createState() => _AddProfileWidgetState();
}

class _AddProfileWidgetState extends State<AddProfileWidget> {
  bool state2 = false;
  final Profileimage = [
    'assets/edit/animal (1).png',
    'assets/edit/animal (2).png',
    'assets/edit/animal (3).png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Positioned(
              child: Stack(
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color:
                          state2 ? Colors.white.withOpacity(0.2) : Colors.white,
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
                    child: state2
                        ? Container()
                        : BlurryContainer(
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
              bottom: 5,
              right: 0,
              child: Stack(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color:
                          state2 ? Colors.white.withOpacity(0.2) : Colors.white,
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
                    child: state2
                        ? Container()
                        : BlurryContainer(
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
          height: 25,
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
                textAlign: TextAlign.center, style: White(12, FontWeight.w500)),
          ),
        )
      ],
    );
  }
}
