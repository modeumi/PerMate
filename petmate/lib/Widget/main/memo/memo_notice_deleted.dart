import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/button/deletedbutton/memo_deleted_button.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/main/memo/memo_deleted.dart';

class MemoNoticeDeleted extends StatefulWidget {
  const MemoNoticeDeleted({
    super.key,
  });

  @override
  State<MemoNoticeDeleted> createState() => _MemoNoticeDeletedState();
}

class _MemoNoticeDeletedState extends State<MemoNoticeDeleted> {
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
              title: '수정하기',
              action: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset('assets/edit/plus.png'),
                ),
                SizedBox(
                  width: 8.w,
                ),
                GestureDetector(
                  onTap: () {},
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
                        MemoDeleted(),
                      ],
                    ))),
            SizedBox(
              height: 10.h,
            ),
            MemoDeletedButton(),
            SizedBox(
              height: 70.h,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
