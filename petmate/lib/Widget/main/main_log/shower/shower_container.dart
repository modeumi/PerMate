import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/button/big_save_button.dart';
import 'package:petmate/Widget/button/save_button.dart';
import 'package:petmate/Widget/custom_widget/circle_container.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class ShowerContainer extends StatefulWidget {
  const ShowerContainer({super.key});

  @override
  State<ShowerContainer> createState() => _ShowerContainerState();
}

class _ShowerContainerState extends State<ShowerContainer> {
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  String min = '분';

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
          top: 37.h,
          child: Container(
            width: 320.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(
            left: 12.w,
            top: 97.h,
            child: Text(
              '소요시간',
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
              controller: _textEditingController,
              focusNode: _focusNode,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: '-- 분',
                hintStyle: Gray(14.sp, FontWeight.w500),
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 12),
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
            onTap: () {
              
            },
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
            top: 456.h,
            child: Text(
              '대상 추가',
              style: White(14.sp, FontWeight.w600),
            )),
        Positioned(
          left: 12.w,
          top: 481.h,
          child: Container(
            width: 320.w,
            height: 96.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(
          left: 88.w,
          top: 493.h,
          child: Container(
            width: 52.w,
            height: 72.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/image_asset/record/add pet.png'),
                Text(
                  '추가하기',
                  style: Black(10.sp, FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 24.w,
          top: 493.h,
          child: Container(
            width: 52.w,
            height: 72.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleContainer(
                  width: 52.w,
                  height: 52.h,
                ),
                Text(
                  '추가하기',
                  style: Black(10.sp, FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        Positioned(
            left: 32.w,
            top: 501.h,
            child: Image.asset('assets/image_asset/record/Image.png')),
        Positioned(
            left: 12.w,
            bottom: -2.h,
            child: BigSaveButton(content: '저장', action: () {}))
      ],
    );
  }
}
