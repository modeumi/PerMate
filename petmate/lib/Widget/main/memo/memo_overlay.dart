// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petmate/Controller/memo_controller.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/button/save_button.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class MemoOverlay extends StatefulWidget {
  MemoOverlay({
    Key? key,
  }) : super(key: key);

  @override
  State<MemoOverlay> createState() => _MemoOverlayState();
}

class _MemoOverlayState extends State<MemoOverlay> {
  MemoController memoController = Get.put(MemoController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 98.h,
          left: 8.w,
          right: 8.w,
          child: Stack(
            children: [
              CustomContainer(
                  width: 344.w, height: 380.h, shadow_color: Color(0x26000000)),
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
                  child: Image.asset('assets/image_asset/alarm/close.png'),
                ),
              ),
              Positioned(
                  top: 30,
                  left: 12,
                  child: Container(
                    width: 330.w,
                    height: 380.h,
                    child: TextField(
                      controller: memoController.contentController,
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: '내용 입력',
                        hintStyle: whiteOpacity(14.sp, FontWeight.w500),
                        enabledBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                      onChanged: (value) {
                        setState(() {
                          memoController.Memocontent = value;
                        });
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
                  child: SaveButton(
                      content: '저장',
                      action: () {
                        setState(() {
                          memoController.firestore
                              .collection('Memo')
                              .doc()
                              .set({
                            "content": memoController.Memocontent,
                            "timestamp": FieldValue.serverTimestamp()
                          });
                          memoController.contentController.clear();
                          Get.back();
                        });
                      }))
            ],
          ),
        ),
      ],
    );
  }
}
