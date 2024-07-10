import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_widget/circle_container.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class DetailsAddWidget extends StatefulWidget {
  const DetailsAddWidget({super.key});

  @override
  State<DetailsAddWidget> createState() => _DetailsAddWidgetState();
}

class _DetailsAddWidgetState extends State<DetailsAddWidget> {
  bool state = false;

  Map<String, dynamic> result = {
    '종류': '강아지',
    '품종': '시고르자브종',
    '성별': '남',
    '생일': '2021.04.03',
    '처음만난날': '2021.04.30',
    '몸무게': '10KG',
    '중성화 여부': '했음',
    '중성화 날짜': '2022.04.03',
    '염려 · 보유 질환': '눈 · 질환1',
    '보유 알러지': '알러지1',
    '접종 기록': ['접종명1', '접종명2'],
    '수술 기록': '수술1'
  };

  Widget test(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(title, style: White(14, FontWeight.w600)),
        ),
        Stack(children: [
          GlassContainer(
            width: 320.w,
            height: 40.h,
            margin: EdgeInsets.all(8),
            color: Color(0x3300287C),
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.white.withOpacity(0.2),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderGradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.2),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.10, 0.60, 0.40, 0.0],
            ),
            blur: 12,
            borderRadius: BorderRadius.circular(10),
            borderWidth: 1.0,
            elevation: 0,
          ),
          Positioned(
            top: 18.h,
            left: 110.w,
            child: Container(
              width: 110.w,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  content ?? '',
                  style: White(14.sp, FontWeight.w500),
                ),
              ),
            ),
          )
        ]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomContainer(
              width: 344.w, height: 930.h, shadow_color: Color(0x26000000)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(children: [
            for (String key in result.keys)
              result[key] != null
                  ? test(key, result[key].toString())
                  : Container(),
          ]),
        ),
      ],
    );
  }
}
