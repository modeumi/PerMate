import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/bottom_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/notice/NotificationContainer2.dart';
import 'package:petmate/Widget/notice/noticfication_check_deleted.dart';
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/notice/notification_type.dart';

class NoticeDeleted extends StatefulWidget {
  const NoticeDeleted({super.key});

  @override
  State<NoticeDeleted> createState() => _NoticeDeletedState();
}

class _NoticeDeletedState extends State<NoticeDeleted> {
  var opactiyValue = 1.0;
  List<bool> deletedCheck = [false, false, false];
  bool state = false;
  OverlayEntry? deletoverlay;

  void deletedItems() {
    setState(() {
      deletedCheck.asMap().forEach((index, isSelected) {
        if (isSelected) {
          deletedCheck[index] = false;
        }
      });
    });
  }

  void Deletedoevrlay(BuildContext context) {
    setState(() {
      opactiyValue = 0.1;
    });

    Future.delayed(Duration(seconds: 0), () {
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
              child: Stack(
                children: [
                  Container(
                    width: 360,
                    height: 160,
                    decoration: BoxDecoration(
                      color: state
                          ? Colors.white.withOpacity(0.2)
                          : Colors.transparent,
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
                              child: Text('알림을 삭제할까요?')),
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
                                child: Text('알림을 삭제한 후에는 복구할 수 없어요.')),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: Row(
                            children: [
                              Container(
                                width: 156,
                                height: 48,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                decoration: ShapeDecoration(
                                  color: Colors.white
                                      .withOpacity(0.800000011920929),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0x332B80FF)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    DefaultTextStyle(
                                        style: TextStyle(
                                          color: Color(0xFF2B80FF),
                                          fontSize: 15,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w600,
                                        ),
                                        child: Text('취소')),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Container(
                                  width: 156,
                                  height: 48,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF2B80FF),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: Colors.white
                                            .withOpacity(0.20000000298023224),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      DefaultTextStyle(
                                          style: White(15, FontWeight.w600),
                                          child: Text('삭제하기')),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 850,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Main/Background.png'),
              fit: BoxFit.fill),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset('assets/alert/back.png'),
                        ),
                        Text('알림',
                            textAlign: TextAlign.center,
                            style: White(20, FontWeight.w600)),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset('assets/alert/delete(24).png'),
                        ),
                      ],
                    ),
                  ),
                ),
                NotificationWidget(),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        NotificationCheckDeleted(),
                        NotificationCheckDeleted(),
                        NotificationCheckDeleted(),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      opactiyValue = 0.1;
                    });
                  },
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: 344,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.800000011920929),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Colors.white
                                    .withOpacity(0.20000000298023224),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x33000000),
                                blurRadius: 12,
                                offset: Offset(0, 0),
                                spreadRadius: 5,
                              )
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Deletedoevrlay(context);
                            },
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
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 75,
                )
              ],
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomBottomNavigationBar())
          ],
        ),
      ),
    );
  }
}
