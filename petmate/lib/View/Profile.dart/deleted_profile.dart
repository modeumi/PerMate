import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Notice/noticedelete.dart';
import 'package:petmate/View/mainpage.dart';
import 'package:petmate/Widget/bottom_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/main/button_widget/deleted_button.dart';
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/notice/notification_type.dart';
import 'package:petmate/Widget/profile/mypet_deleted_widget.dart';
import 'package:petmate/Widget/profile/mypet_edit_widget.dart';
import 'package:petmate/Widget/profile/sharepet_deleted_widget.dart';

class DeletedProfilePage extends StatefulWidget {
  const DeletedProfilePage({super.key});

  @override
  State<DeletedProfilePage> createState() => _DeletedProfilePageState();
}

class _DeletedProfilePageState extends State<DeletedProfilePage> {
  bool state = false;

  List<bool> deletedCheck = [false, false, false];

  OverlayEntry? deletoverlay;
  var opactiyValue = 1.0;

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
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    List<int> indexesToRemove = [];
                                    for (int i = deletedCheck.length - 1;
                                        i >= 0;
                                        i--) {
                                      if (deletedCheck[i]) {
                                        deletedCheck.removeAt(i);
                                      }
                                    }
                                    for (int index in indexesToRemove) {
                                      deletedCheck.removeAt(index);
                                    }
                                  });
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
                            child: Image.asset('assets/alert/back.png')),
                        Container(
                          width: 20,
                        ),
                        Text('수정하기',
                            textAlign: TextAlign.center,
                            style: White(20, FontWeight.w600)),
                        Container(
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Image.asset('assets/Main/add.png'),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child:
                                    Image.asset('assets/alert/delete(24).png'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Text(
                    '순서를 수정하면 홈에서 노출되는 순서에 반영됩니다.',
                    style: White(12, FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      MyPetDeletedWidget(),
                      SharePetDeletedWidget(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(bottom: 70, left: 10, child: DeletedButtonWidget()),
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
