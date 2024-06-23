import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Util/textstyles.dart';

class MemoDeletedButton extends StatefulWidget {
  const MemoDeletedButton({super.key});

  @override
  State<MemoDeletedButton> createState() => _MemoDeletedButtonState();
}

class _MemoDeletedButtonState extends State<MemoDeletedButton> {
  List<bool> deletedCheck = [false, false, false];
  bool state = false;

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
                    width: 360.w,
                    height: 160.h,
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
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(),
                          ),
                  ),
                  Container(
                    width: 360.w,
                    height: 160.h,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.white.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 100.w,
                          height: 48.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 5.w,
                              ),
                              Image.asset('assets/alert/delete(14).png'),
                              DefaultTextStyle(
                                style: Black(14.sp, FontWeight.w600),
                                child: Text('삭제하기'),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 45,
                          left: 20,
                          child: DefaultTextStyle(
                              style: Black(12.sp, FontWeight.w500),
                              child: Text('메모를 삭제할까요?')),
                        ),
                        Positioned(
                          top: 64,
                          left: 20,
                          child: Container(
                            width: 195.w,
                            child: DefaultTextStyle(
                                style: Black(12.sp, FontWeight.w500),
                                child: Text('메모를 삭제한 후에는 복구할수 없어요.')),
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
                                  width: 156.w,
                                  height: 48.h,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  decoration: ShapeDecoration(
                                    color: Colors.white
                                        .withOpacity(0.800000011920929),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.w, color: Color(0x332B80FF)),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      DefaultTextStyle(
                                          style: Blue(15.sp, FontWeight.w600),
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
                                  width: 156.w,
                                  height: 48.h,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF2B80FF),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1.w,
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
                                          style: White(15.sp, FontWeight.w600),
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
    return Stack(
      children: [
        Container(
          width: 344.w,
          height: 60.h,
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.8),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.w,
                color: Colors.white.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(10.r),
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
        ),
        Opacity(
          opacity: 0.8,
          child: Container(
            width: 344.w,
            height: 60.h,
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
                borderRadius: BorderRadius.circular(10.r)),
          ),
        ),
        Positioned(
          left: 125,
          bottom: 20,
          child: GestureDetector(
            onTap: () {
              Deletedoevrlay(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/alert/delete(16).png'),
                SizedBox(
                  width: 8.w,
                ),
                Text('삭제하기',
                    textAlign: TextAlign.center,
                    style: Black(16.sp, FontWeight.w600)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
