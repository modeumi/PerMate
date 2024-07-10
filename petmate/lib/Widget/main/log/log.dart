import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';
import 'package:petmate/Widget/main/log/logcard.dart';

class LogWidget extends StatefulWidget {
  const LogWidget({super.key});

  @override
  State<LogWidget> createState() => _LogWidgetState();
}

class _LogWidgetState extends State<LogWidget> {
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
                          CustomContainer(
                              width: 344.w,
                              height: 380.h,
                              shadow_color: Color(0x26000000)),
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
                              width: 288.w,
                              height: 315.h,
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
          CustomContainer(
              width: 168.w, height: 64.h, shadow_color: Color(0x26000000)),
          Positioned(
            left: 30,
            bottom: 18,
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
