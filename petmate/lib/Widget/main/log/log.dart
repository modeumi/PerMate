import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/main/log/logcard.dart';
import 'package:petmate/Widget/profile/add/profile_card.dart';

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
                      top: 190,
                      left: 8,
                      right: 8,
                      child: Stack(
                        children: [
                          Container(
                            width: 344.w,
                            height: 380.h,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: GradientBoxBorder(
                                width: 1.w,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.5),
                                    Colors.white.withOpacity(0.2)
                                  ],
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: BlurryContainer(
                              blur: 12,
                              elevation: 0,
                              borderRadius: BorderRadius.circular(10.r),
                              child: Container(),
                            ),
                          ),
                          Opacity(
                            opacity: 0.4,
                            child: Container(
                              width: 344.w,
                              height: 380.h,
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
                                  borderRadius: BorderRadius.circular(10.r)),
                            ),
                          ),
                          Positioned(
                            top: 12,
                            left: 12,
                            child: Text(
                              '기록 하기',
                              style: White(16.sp, FontWeight.w600),
                            ),
                          ),
                          Positioned(
                            top: 45,
                            left: 35,
                            right: 20,
                            child: Container(
                              width: 344.w,
                              height: 380.h,
                              child: GridView(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisExtent: 72,
                                        crossAxisSpacing: 8.0,
                                        mainAxisSpacing: 40.0),
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: LogCard(
                                      CardName: '목욕',
                                      Cardimg:
                                          'assets/image_asset/record/shower.png',
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: LogCard(
                                      CardName: '용변',
                                      Cardimg:
                                          'assets/image_asset/record/toilet.png',
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: LogCard(
                                      CardName: '식사',
                                      Cardimg:
                                          'assets/image_asset/record/food.png',
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: LogCard(
                                      CardName: '진료',
                                      Cardimg:
                                          'assets/image_asset/record/examine.png',
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: LogCard(
                                      CardName: '놀이',
                                      Cardimg:
                                          'assets/image_asset/record/play.png',
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: LogCard(
                                      CardName: '체중',
                                      Cardimg:
                                          'assets/image_asset/record/weight.png',
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: LogCard(
                                      CardName: '미용',
                                      Cardimg:
                                          'assets/image_asset/record/beauty.png',
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: LogCard(
                                      CardName: '주의',
                                      Cardimg:
                                          'assets/image_asset/record/notice.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                    // Positioned(bottom: 142, left: 5, child: LogWidget())
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
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 168,
            height: 64,
            margin: EdgeInsets.only(top: 3),
            decoration: BoxDecoration(
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
              borderRadius: BorderRadius.circular(10),
            ),
            child: state
                ? Container(
                    color: Colors.white,
                  )
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
              margin: EdgeInsets.only(top: 5),
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
            left: 32,
            top: 18,
            child: Container(
              width: 88,
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/Main/note.png'),
                  Text('기록 하기',
                      textAlign: TextAlign.center,
                      style: White(12, FontWeight.w500)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
