import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/button/deletedbutton/content_deleted_button.dart';

class NoticeDeletedButton extends StatefulWidget {
  const NoticeDeletedButton({super.key});

  @override
  State<NoticeDeletedButton> createState() => _NoticeDeletedButtonWidgetState();
}

class _NoticeDeletedButtonWidgetState extends State<NoticeDeletedButton> {
  var opactiyValue = 1.0;


  void Deletedoevrlay(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      setState(() {
        opactiyValue = 1.0;
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return ContentDeletedButton(
                title: '알림을 삭제할까요?',
              content: '알림을 삭제한 후에는 복구할수 없어요.',
           
               sharecontent: '',
                 action: () {  },
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
        ],
      ),
    );
  }
}
