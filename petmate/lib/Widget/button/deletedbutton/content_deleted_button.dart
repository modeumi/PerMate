import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petmate/Util/textstyles.dart';

class ContentDeletedButton extends StatefulWidget {
  final String title;
  final String content;
  final String sharecontent;
  final VoidCallback action;
  final bool? active;
  const ContentDeletedButton(
      {super.key,
      required this.title,
      required this.content,
      required this.sharecontent,
      this.active,
      required this.action});

  @override
  State<ContentDeletedButton> createState() => _ContentDeletedButtonState();
}

class _ContentDeletedButtonState extends State<ContentDeletedButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 360.w,
          height: 186.h,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: BlurryContainer(
            blur: 12,
            elevation: 0,
            borderRadius: BorderRadius.circular(10.r),
            child: Container(),
          ),
        ),
        Container(
          width: 360.w,
          height: 186.h,
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
                        child: Text('삭제하기')),
                  ],
                ),
              ),
              Positioned(
                top: 45,
                left: 20,
                child: DefaultTextStyle(
                    style: Black(12.sp, FontWeight.w500),
                    child: Text(widget.title)),
              ),
              Positioned(
                top: 64,
                left: 20,
                child: Container(
                  width: 195.w,
                  child: DefaultTextStyle(
                      style: Black(12.sp, FontWeight.w500),
                      child: Text(widget.content)),
                ),
              ),
              Positioned(
                top: 88,
                left: 20,
                child: Container(
                  width: 242.w,
                  height: 14.h,
                  child: Opacity(
                    opacity: 0.6,
                    child: DefaultTextStyle(
                        style: Black(12.sp, FontWeight.w500),
                        child: Text(widget.sharecontent)),
                  ),
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
                          color: Colors.white.withOpacity(0.800000011920929),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.w, color: Color(0x332B80FF)),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                        widget.action();
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
                              color:
                                  Colors.white.withOpacity(0.20000000298023224),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}
