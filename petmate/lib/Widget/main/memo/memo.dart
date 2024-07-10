import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_container.dart';
import 'package:petmate/Widget/main/memo/memo_notice.dart';

class MemoWriteWidget extends StatefulWidget {
  const MemoWriteWidget({super.key});

  @override
  State<MemoWriteWidget> createState() => _MemoWriteWidgetState();
}

class _MemoWriteWidgetState extends State<MemoWriteWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => MemoNotice());
      },
      child: Stack(children: [
        CustomContainer(
          width: 344.w,
          height: 108.h,
        ),
        Positioned(
          top: 12.h,
          left: 12.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('메모', style: White(12.sp, FontWeight.w500)),
              Container(
                width: 124.w,
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 4.w,
                      height: 4.h,
                      child: Image.asset(
                        'assets/Main/Rectangle (1).png',
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    Opacity(
                        opacity: 0.6,
                        child: Text('메모 작성시 표시됩니다.',
                            style: White(12.sp, FontWeight.w500))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
