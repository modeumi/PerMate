import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class MainAlram extends StatefulWidget {
  const MainAlram({super.key});

  @override
  State<MainAlram> createState() => _MainAlramState();
}

class _MainAlramState extends State<MainAlram> {
  bool state = false;
  bool state2 = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 55),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 247,
                height: 40,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: state2
                      ? Colors.white.withOpacity(0.2)
                      : Colors.transparent,
                  border: GradientBoxBorder(
                    width: 1,
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.20000000298023224)
                      ],
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: state2
                    ? Container()
                    : BlurryContainer(
                        blur: 12,
                        elevation: 0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(),
                      ),
              ),
              Opacity(
                opacity: 0.4,
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: 247,
                  height: 40,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 2,
                          offset: Offset(4, 4),
                        )
                      ],
                      color: Color(0x26000000),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Positioned(
                  left: 20,
                  top: 18,
                  child: Image.asset('assets/Main/Clock.png')),
              Positioned(
                  left: 50,
                  top: 18,
                  child: Opacity(
                    opacity: 0.6,
                    child: Text(
                      '알람 등록시 표시됩니다.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
            ],
          ),
          Stack(
            children: [
              Opacity(
                opacity: 0.2,
                child: Container(
                  width: 40,
                  height: 40,
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
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 2,
                        offset: Offset(2, 2),
                        spreadRadius: 0,
                      )
                    ],
                    border: GradientBoxBorder(
                      width: 1,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.20000000298023224)
                        ],
                      ),
                    ),
                  ),
                  child: ClipOval(
                      child: Container(
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      "assets/Main/invite.png",
                    ),
                  )),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 8,
          ),
          Stack(
            children: [
              Opacity(
                opacity: 0.2,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        offset: Offset(2, 2),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 2,
                        offset: Offset(2, 2),
                        spreadRadius: 0,
                      )
                    ],
                    border: GradientBoxBorder(
                      width: 1,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.20000000298023224)
                        ],
                      ),
                    ),
                  ),
                  child: ClipOval(
                      child: Container(
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      "assets/Main/notification.png",
                    ),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
