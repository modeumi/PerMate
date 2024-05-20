import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Controller/toggle_controller.dart';
import 'package:petmate/Util/textstyles.dart';

class AlarmDeletedButton extends StatefulWidget {
  const AlarmDeletedButton({super.key});

  @override
  State<AlarmDeletedButton> createState() => _AlarmDeletedButtonState();
}

class _AlarmDeletedButtonState extends State<AlarmDeletedButton> {
  final ToggleButtonController controller = Get.put(ToggleButtonController());
  List<bool> deletedCheck = [false, false, false];

  OverlayEntry? deletoverlay;
  var opactiyValue = 1.0;

  void deletedItems() {
    setState(() {
      for (var i = 0; i < deletedCheck.length; i++) {
        if (deletedCheck[i]) ;
      }
    });
  }

  void Deletedoevrlay(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      setState(() {
        opactiyValue = 1.0;
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return AnimatedContainer(
                duration: Duration(milliseconds: 0),
                curve: Curves.easeIn,
                child: Stack(children: [
                  Container(
                    width: 360,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: BlurryContainer(
                      blur: 12,
                      elevation: 0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(),
                    ),
                  ),
                  Container(
                      width: 360,
                      height: 160,
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: Colors.white.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Image.asset('assets/alert/delete(14).png'),
                                DefaultTextStyle(
                                  style: TextStyle(
                                    color: Color(0xFF303030),
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                  child: Text('삭제하기'),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 20,
                            child: DefaultTextStyle(
                                style: TextStyle(
                                  color: Color(0xFF303030),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                ),
                                child: Text('알람을 삭제할까요?')),
                          ),
                          SizedBox(height: 8),
                          Positioned(
                            top: 60,
                            left: 20,
                            child: Container(
                              width: 195,
                              child: DefaultTextStyle(
                                  style: TextStyle(
                                    color: Color(0xFF303030),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  child: Text('알람을 삭제한 후에는 복구할 수 없어요.')),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 4,
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        width: 156,
                                        height: 48,
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white
                                              .withOpacity(0.800000011920929),
                                          border: GradientBoxBorder(
                                            width: 1,
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF2B80FF)
                                                    .withOpacity(0.5),
                                                Color(0xFF2B80FF)
                                                    .withOpacity(0.2)
                                              ],
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: BlurryContainer(
                                          blur: 12,
                                          elevation: 0,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(),
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.8,
                                      child: Container(
                                        margin: EdgeInsets.all(8),
                                        width: 156,
                                        height: 48,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x26000000),
                                                blurRadius: 2,
                                                offset: Offset(0, 2),
                                                spreadRadius: 0,
                                              )
                                            ],
                                            color: Colors.white
                                                .withOpacity(0.800000011920929),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                    Positioned(
                                      left: 60,
                                      top: 20,
                                      child: Text(
                                        '취소하기',
                                        style: Blue(15, FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        deletedCheck.length;
                                      },
                                      child: Container(
                                        width: 156,
                                        height: 48,
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF2B80FF),
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
                                              BorderRadius.circular(10),
                                        ),
                                        child: BlurryContainer(
                                          blur: 12,
                                          elevation: 0,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(),
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.8,
                                      child: Container(
                                        margin: EdgeInsets.all(8),
                                        width: 156,
                                        height: 48,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x26000000),
                                                blurRadius: 2,
                                                offset: Offset(0, 2),
                                                spreadRadius: 0,
                                              )
                                            ],
                                            color: Color(0xFF2B80FF),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                    Positioned(
                                      left: 60,
                                      top: 20,
                                      child: Text(
                                        '삭제하기',
                                        style: White(15, FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                ]));
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            controller.turnOff();
          },
          child: Stack(
            children: [
              Container(
                width: 168,
                height: 60,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 8,
                      offset: Offset(0, 0),
                      spreadRadius: 2,
                    )
                  ],
                ),
              ),
              Opacity(
                opacity: 0.8,
                child: Container(
                  width: 168,
                  height: 60,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x33000000),
                          blurRadius: 2,
                          offset: Offset(2, 2),
                          spreadRadius: 0,
                        )
                      ],
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Positioned(
                left: 40,
                bottom: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/image_asset/alarm/turnoff.png'),
                    SizedBox(
                      width: 8,
                    ),
                    Text('알람끄기',
                        textAlign: TextAlign.center,
                        style: Black(16, FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 6,
        ),
        GestureDetector(
          onTap: () {
            Deletedoevrlay(context);
          },
          child: Stack(
            children: [
              Container(
                width: 168,
                height: 60,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 8,
                      offset: Offset(0, 0),
                      spreadRadius: 2,
                    )
                  ],
                ),
              ),
              Opacity(
                opacity: 0.8,
                child: Container(
                  width: 168,
                  height: 60,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x33000000),
                          blurRadius: 2,
                          offset: Offset(2, 2),
                          spreadRadius: 0,
                        )
                      ],
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Positioned(
                left: 40,
                bottom: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/alert/delete(16).png'),
                    SizedBox(
                      width: 8,
                    ),
                    Text('삭제하기',
                        textAlign: TextAlign.center,
                        style: Black(16, FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
