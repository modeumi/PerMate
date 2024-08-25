import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/button/big_save_button.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class CareContainer extends StatefulWidget {
  const CareContainer({super.key});

  @override
  State<CareContainer> createState() => _CareContainerState();
}

class _CareContainerState extends State<CareContainer> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomContainer(
          width: 344.w,
          height: 530.h,
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
              '횟수',
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
            child: Container(
              width: 290.w,
              height: 16.h,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/image_asset/record/minus.png'),
                  Text(
                    '1',
                    style: Black(14.sp, FontWeight.w500),
                  ),
                  Image.asset('assets/image_asset/record/plus.png'),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            left: 12.w,
            top: 182.h,
            child: Text(
              '메모',
              style: White(14.sp, FontWeight.w600),
            )),
        Positioned(
          left: 12.w,
          top: 207.h,
          child: Container(
            width: 320.w,
            height: 76.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: '메모 입력',
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
          ),
        ),
        Positioned(
            left: 12.w,
            top: 303.h,
            child: Text(
              '사진 · 영상',
              style: White(14.sp, FontWeight.w600),
            )),
        Positioned(
          left: 12.w,
          top: 328.h,
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
