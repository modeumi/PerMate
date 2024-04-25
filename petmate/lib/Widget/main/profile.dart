import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class ProfilePlus extends StatefulWidget {
  const ProfilePlus({super.key});

  @override
  State<ProfilePlus> createState() => _ProfilePlusState();
}

class _ProfilePlusState extends State<ProfilePlus> {
  bool state = false;
  bool state2 = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Opacity(
                opacity: 0.4,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  width: 50,
                  height: 50,
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    state = !state;
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: state ? Colors.white : Colors.transparent,
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
                  child: ClipOval(
                    child: state
                        ? Container(
                            width: 50,
                            height: 50,
                          )
                        : BlurryContainer(
                            blur: 12,
                            elevation: 0,
                            child: Image.asset('assets/Main/add.png')),
                  ),
                ),
              ),
              Positioned(
                bottom: -23,
                left: 10,
                child: Text(
                  '추가하기',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Opacity(
                opacity: 0.4,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  width: 50,
                  height: 50,
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
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: state ? Colors.white : Colors.transparent,
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
                  child: ClipOval(
                    child: state
                        ? Container(
                            width: 50,
                            height: 50,
                          )
                        : BlurryContainer(
                            blur: 12,
                            elevation: 0,
                            child: Image.asset('assets/Main/edit.png')),
                  ),
                ),
              ),
              Positioned(
                bottom: -23,
                left: 8,
                child: Text(
                  '수정하기',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                  top: 85,
                  left: -59,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 2,
                              offset: Offset(1, 0),
                              spreadRadius: 0,
                            )
                          ]),
                      child: Image.asset(
                          'assets/banner/InformationBanner (1).png'))),
              Positioned(
                  top: 90,
                  left: -48,
                  child: Text(
                    '정보',
                    style: TextStyle(
                      color: Color(0xFF303030),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              Positioned(
                  top: 90,
                  left: 225,
                  child: Text(
                    '더보기',
                    style: TextStyle(
                      color: Color(0xFF303030),
                      fontSize: 10,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              Positioned(
                  top: 93,
                  left: 258,
                  child: Image.asset('assets/Main/left.png')),
              Positioned(
                  top: 112,
                  left: -29,
                  child: Image.asset('assets/Main/bigleft.png')),
              Positioned(
                  top: 112,
                  left: 252,
                  child: Image.asset('assets/Main/bigright.png')),
              Positioned(
                  top: 112,
                  left: -19,
                  child: Text('강아지가 가구를 물어뜯는 이유를 알고 계신가요?',
                      style: TextStyle(
                        color: Color(0xFF303030),
                        fontSize: 13,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}
