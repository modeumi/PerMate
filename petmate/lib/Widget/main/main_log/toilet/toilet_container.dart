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
          height: 494.h,
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
            bottom: -2.h,
            child: BigSaveButton(content: '저장', action: () {}))
      ],
    );
  }
}
