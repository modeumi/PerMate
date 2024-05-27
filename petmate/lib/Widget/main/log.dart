import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class LogWidget extends StatefulWidget {
  const LogWidget({super.key});

  @override
  State<LogWidget> createState() => _LogWidgetState();
}

class _LogWidgetState extends State<LogWidget> {
  bool state = false;

  OverlayEntry? deletoverlay;
  var opactiyValue = 1.0;

  void Deletedoevrlay(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      setState(() {
        opactiyValue = 1.0;
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          barrierColor: Color(0x66303030),
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return AnimatedContainer(
                duration: Duration(milliseconds: 0),
                child: Stack(
                  children: [
                    Positioned(
                      top: 195,
                      left: 8,
                      right: 8,
                      child: Stack(
                        children: [
                          Container(
                            width: 344,
                            height: 380,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
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
                            child: BlurryContainer(
                              blur: 12,
                              elevation: 0,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(),
                            ),
                          ),
                          Opacity(
                            opacity: 0.4,
                            child: Container(
                              width: 344,
                              height: 380,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x4C000000),
                                      blurRadius: 1,
                                      offset: Offset(1, 1),
                                      spreadRadius: 0,
                                    )
                                  ],
                                  color: Color(0x3300287C),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          Positioned(
                            top: 12,
                            left: 12,
                            child: Text(
                              '기록하기',
                              style: White(16, FontWeight.w600),
                            ),
                          ),
                          Positioned(
                            top: 48,
                            left: 35,
                            right: 20,
                            child: Container(
                              width: 344,
                              height: 380,
                              child: GridView.builder(
                                  itemCount: 8, //item 개수
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, //1 개의 행에 보여줄 item 개수

                                    mainAxisSpacing: 4, //수평 Padding
                                    crossAxisSpacing: 4, //수직 Padding
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Stack(
                                      children: [
                                        Container(
                                          width: 72,
                                          height: 72,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            border: GradientBoxBorder(
                                              width: 1,
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.white.withOpacity(0.5),
                                                  Colors.white.withOpacity(0.2)
                                                ],
                                              ),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: BlurryContainer(
                                            blur: 12,
                                            elevation: 0,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Container(),
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.4,
                                          child: Container(
                                            width: 72,
                                            height: 72,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x26000000),
                                                    blurRadius: 2,
                                                    offset: Offset(4, 4),
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ),
                          Positioned(
                              left: 10,
                              top: 16,
                              right: 16,
                              child: Image.asset(
                                  'assets/image_asset/record/shower.png')),
                          Positioned(
                            right: 12,
                            top: 12,
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Image.asset(
                                  'assets/image_asset/alarm/close.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Deletedoevrlay(context);
      },
      child: Stack(
        children: [
          Container(
            width: 168,
            height: 64,
            margin: EdgeInsets.fromLTRB(3, 0, 3, 3),
            decoration: BoxDecoration(
              color: state ? Colors.white.withOpacity(0.2) : Colors.transparent,
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
            child: state
                ? Container()
                : BlurryContainer(
                    blur: 12,
                    elevation: 0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(),
                  ),
          ),
          Opacity(
            opacity: 0.4,
            child: Container(
              margin: EdgeInsets.all(4),
              width: 168,
              height: 64,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 1,
                      offset: Offset(1, 1),
                      spreadRadius: 0,
                    )
                  ],
                  color: Color(0x3300287C),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Positioned(
            left: 36,
            top: 16,
            child: Container(
              width: 88,
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/Main/note.png'),
                  Text(
                    '기록 하기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
