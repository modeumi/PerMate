import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/button/big_save_button.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class MedicalContainer extends StatefulWidget {
  const MedicalContainer({super.key});

  @override
  State<MedicalContainer> createState() => _MedicalContainerState();
}

class _MedicalContainerState extends State<MedicalContainer> {
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  String min = 'ml';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _textEditingController.text = min;
        });
      }
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomContainer(
          width: 344.w,
          height: 665.h,
          color: Color(0x3300287C),
          shadow_color: Color(0x4C000000),
        ),
        Positioned(
            left: 12.w,
            top: 12.h,
            child: Text(
              '날짜 · 시간',
              style: White(14.sp, FontWeight.w600),
            )),
        Positioned(
          left: 12.w,
          top: 39.h,
          child: Container(
            width: 320.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.fromLTRB(1, 0, 0, 10),
                focusedBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
              ),
              style: TextStyle(
                color: Colors.black,
                decorationThickness: 0,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Pretendard',
              ),
              cursorColor: Colors.black,
              cursorWidth: 1.w,
            ),
          ),
        ),
        Positioned(
            left: 12.w,
            top: 97.h,
            child: Text(
              '장소',
              style: White(14.sp, FontWeight.w600),
            )),
        Positioned(
            left: 12.w,
            top: 122.h,
            child: Container(
              width: 320.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: '장소를 입력해주세요.',
                  hintStyle: Gray(14.sp, FontWeight.w500),
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 12),
                  focusedBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                ),
                style: TextStyle(
                  color: Colors.black,
                  decorationThickness: 0,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Pretendard',
                ),
                cursorColor: Colors.black,
                cursorWidth: 1.w,
              ),
            )),
        Positioned(
            left: 12.w,
            top: 182.h,
            child: Text(
              '진료 과목',
              style: White(14.sp, FontWeight.w600),
            )),
        Positioned(
            left: 12.w,
            top: 207.h,
            child: Container(
              width: 320.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: '과목을 입력해주세요.',
                  hintStyle: Gray(14.sp, FontWeight.w500),
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 12),
                  focusedBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                ),
                style: TextStyle(
                  color: Colors.black,
                  decorationThickness: 0,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Pretendard',
                ),
                cursorColor: Colors.black,
                cursorWidth: 1.w,
              ),
            )),
        Positioned(
            left: 12.w,
            top: 267.h,
            child: Text(
              '검사 결과',
              style: White(14.sp, FontWeight.w600),
            )),
        Positioned(
            left: 12.w,
            top: 292.h,
            child: Container(
              width: 320.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: '결과를 입력해주세요.',
                  hintStyle: Gray(14.sp, FontWeight.w500),
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 12),
                  focusedBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                ),
                style: TextStyle(
                  color: Colors.black,
                  decorationThickness: 0,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Pretendard',
                ),
                cursorColor: Colors.black,
                cursorWidth: 1.w,
              ),
            )),
        Positioned(
            left: 12.w,
            top: 352.h,
            child: Text(
              '비용',
              style: White(14.sp, FontWeight.w600),
            )),
        Positioned(
            left: 12.w,
            top: 377.h,
            child: Container(
              width: 320.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                focusNode: _focusNode,
                textAlign: TextAlign.center,
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: '-- 원',
                  hintStyle: Gray(14.sp, FontWeight.w500),
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 12),
                  focusedBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                ),
                style: TextStyle(
                  color: Colors.black,
                  decorationThickness: 0,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Pretendard',
                ),
                cursorColor: Colors.black,
                cursorWidth: 1.w,
              ),
            )),
        Positioned(
            left: 12.w,
            top: 437.h,
            child: Text(
              '사진 · 영상',
              style: White(14.sp, FontWeight.w600),
            )),
        Positioned(
          left: 12.w,
          top: 462.h,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 320.w,
              height: 108.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset('assets/image_asset/record/add Image.png'),
            ),
          ),
        ),
        Positioned(
            left: 12.w,
            bottom: -2.h,
            child: BigSaveButton(content: '저장', action: () {}))
      ],
    );
  }
}
