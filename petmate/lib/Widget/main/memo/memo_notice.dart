import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Util/textstyles.dart';

import 'package:petmate/View/Profile/upload_profile.dart';
import 'package:petmate/View/Profile/deleted_profile.dart';

import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/button/save_button.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/custom_container.dart';
import 'package:petmate/Widget/main/memo/memo_notcie_widget.dart';
import 'package:petmate/Widget/main/memo/memo_notice_deleted.dart';

class MemoNotice extends StatefulWidget {
  const MemoNotice({super.key});

  @override
  State<MemoNotice> createState() => _MemoNoticeState();
}

class _MemoNoticeState extends State<MemoNotice> {
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
                  top: 98.h,
                  left: 8.w,
                  right: 8.w,
                  child: Stack(
                    children: [
                      CustomContainer(
                        width: 344.w,
                        height: 380.h,
                      ),
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
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: '메모',
        action: [
          GestureDetector(
            onTap: () {
              Deletedoevrlay(context);
            },
            child: Image.asset('assets/edit/plus.png'),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => MemoNoticeDeleted());
            },
            child: Image.asset('assets/alert/delete(24).png'),
          ),
        ],
      ),
      body: Container(
        width: 360.w,
        height: 850.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Main/Background.png'),
              fit: BoxFit.fill),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 98.h,
              left: 58.w,
              child: Opacity(
                opacity: 0.6,
                child: Text('순서를 수정하면 홈에서 노출되는 순서에 반영됩니다',
                    style: White(12.sp, FontWeight.w500)),
              ),
            ),
            Positioned(top: 124.h, left: 8.w, child: MemoNotcieWidget()),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
