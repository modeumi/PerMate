import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class MemoNotcieWidget extends StatefulWidget {
  const MemoNotcieWidget({super.key});

  @override
  State<MemoNotcieWidget> createState() => _MemoNotcieWidgetState();
}

class _MemoNotcieWidgetState extends State<MemoNotcieWidget> {
  final name = [
    '까먹지 말고 약먹이기 까먹지 말고 약먹이기 까먹지 말고 약먹까먹지 말고 약먹이기까먹지 말고 약먹이기까먹지 말고 약먹이'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 2; i++)
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CustomContainer(
                  width: 344.w,
                  height: 80.h,
                  shadow_color: Color(0x26000000),
                ),
              ),
              Positioned(
                  top: 35.h,
                  left: 11.w,
                  child: Image.asset('assets/edit/menu.png')),
              Positioned(
                left: 40.w,
                top: 35.h,
                child: Container(
                  width: 288.w,
                  height: 38.h,
                  child: Text(name[0],
                      overflow: TextOverflow.ellipsis,
                      style: White(12.sp, FontWeight.w500)),
                ),
              ),
              Positioned(
                right: 12.w,
                bottom: 12.h,
                child:
                    Text('3/28 오후 05:30', style: White(10.sp, FontWeight.w500)),
              )
            ],
          ),
      ],
    );
  }
}
