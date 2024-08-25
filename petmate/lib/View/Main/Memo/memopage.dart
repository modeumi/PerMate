import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Util/textstyles.dart';

import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/button/save_button.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';
import 'package:petmate/Widget/main/memo/memo_widget.dart';
import 'package:petmate/View/Main/Memo/memo_deleted_page.dart';
import 'package:petmate/Widget/main/memo/memo_overlay.dart';

class MemoPage extends StatefulWidget {
  const MemoPage({
    super.key,
  });

  @override
  State<MemoPage> createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {
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
            return MemoOverlay(
              color: Color(0x3300287C),
              shadowcolor: Color(0x26000000),
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
      body: Container(
        width: 360.w,
        height: 850.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Main/Background.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            CustomAppbar(
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
                    Get.to(() => MemoDeletedPage());
                  },
                  child: Image.asset('assets/alert/delete(24).png'),
                ),
              ],
            ),
            Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Opacity(
                          opacity: 0.6,
                          child: Text('순서를 수정하면 홈에서 노출되는 순서에 반영됩니다',
                              style: White(12.sp, FontWeight.w500)),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        MemoWidgett(),
                      ],
                    ))),
            SizedBox(
              height: 70.h,
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
