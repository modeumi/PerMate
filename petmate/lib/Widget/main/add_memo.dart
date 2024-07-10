import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

import 'package:petmate/Widget/button/save_button.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class MeMoWidget extends StatefulWidget {
  const MeMoWidget({super.key});

  @override
  State<MeMoWidget> createState() => _MeMoWidgetState();
}

class _MeMoWidgetState extends State<MeMoWidget> {
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
            return Stack(
              children: [
                Positioned(
                  top: 266.h,
                  left: 8.w,
                  right: 8.w,
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
                          '메모추가',
                          style: White(16.sp, FontWeight.w600),
                        ),
                      ),
                      Positioned(
                        right: 12,
                        top: 12,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child:
                              Image.asset('assets/image_asset/alarm/close.png'),
                        ),
                      ),
                      Positioned(
                          top: 30,
                          left: 12,
                          child: Container(
                            width: 344.w,
                            height: 380.h,
                            child: TextField(
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: '내용 입력',
                                hintStyle: whiteOpacity(14.sp, FontWeight.w500),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              onSubmitted: (value) {
                                setState(() {});
                              },
                              style: TextStyle(
                                  color: Colors.white, decorationThickness: 0),
                              cursorColor: Colors.white,
                              cursorWidth: 1.w,
                            ),
                          )),
                      Positioned(
                          top: 316,
                          left: 12,
                          right: 12,
                          child: Container(
                            width: 320.w,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2.w,
                                        color: Colors.white.withOpacity(0.5)))),
                          )),
                      Positioned(
                          top: 307.h,
                          left: 8.w,
                          right: 8.w,
                          child: SaveButton(content: '저장', action: () {}))
                    ],
                  ),
                ),
              ],
            );
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
          CustomContainer(
              width: 168.w, height: 64.h, shadow_color: Color(0x26000000)),
          Positioned(
            left: 30.w,
            bottom: 18.h,
            child: Container(
              width: 88.w,
              height: 32.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/Main/memo.png'),
                  Text('메모 추가',
                      textAlign: TextAlign.center,
                      style: White(12.sp, FontWeight.w500)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
