import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/button/big_save_button.dart';
import 'package:petmate/Widget/custom_widget/circle_container.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';
import 'package:petmate/Widget/custom_widget/optiontype.dart';

class ToiletContainer extends StatefulWidget {
  const ToiletContainer({super.key});

  @override
  State<ToiletContainer> createState() => _ToiletContainerState();
}

class _ToiletContainerState extends State<ToiletContainer> {
  TextEditingController _textEditingController = TextEditingController();
  int button = -1;
  final gender = ['남', '여'];

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomContainer(
          width: 344.w,
          height: 700.h,
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
              '종류',
              style: White(14.sp, FontWeight.w600),
            )),
        Positioned(
            left: 2.w,
            top: 122.h,
            child: OptionType(
              width: 340.w,
              options: ['소변', '대변'],
              onChanged: (value) {},
            )),
        Positioned(
            left: 12.w,
            top: 182.h,
            child: Text(
              '횟수',
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
            top: 267.h,
            child: Text(
              '색상 · 상태',
              style: White(14.sp, FontWeight.w600),
            )),
        Positioned(
          left: 12.w,
          top: 336.h,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 320.w,
              height: 74.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
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
        ),
        Positioned(
            left: 12.w,
            top: 430.h,
            child: Text(
              '메모',
              style: White(14.sp, FontWeight.w600),
            )),
        Positioned(
          left: 12.w,
          top: 455.h,
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
          top: 550.h,
          child: Row(
            children: [
              Text('· ', style: White(14.sp, FontWeight.w600)),
              Text(
                  '강아지,고양이를 기준으로 작성된 정보입니다. 이외의 반려동물들의 건강정보는 \n 직접적인 관찰과 변화를 기록하며 체크하길 권장합니다. ',
                  style: White(10.sp, FontWeight.w600)),
            ],
          ),
        ),
        Positioned(
          left: 12.w,
          top: 584.h,
          child: Row(
            children: [
              Text('· ', style: White(14.sp, FontWeight.w600)),
              Text(
                  '제공되는 건강정보 및 상태정보는 참고용으로만 활용, 이상반응등의 건강이 염려\n되는 경우 즉시 수의사에게 문의하시기 바랍니다.',
                  style: White(10.sp, FontWeight.w600)),
            ],
          ),
        ),
        Positioned(
            left: 12.w,
            bottom: -6.h,
            child: BigSaveButton(content: '저장', action: () {}))
      ],
    );
  }
}
