import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/circle_container.dart';
import 'package:petmate/Widget/custom_container.dart';
import 'package:petmate/Widget/profile/deleted/co_pet_care.dart';

class MemoDeleted extends StatefulWidget {
  const MemoDeleted({super.key});

  @override
  State<MemoDeleted> createState() => _MemoDeletedState();
}

class _MemoDeletedState extends State<MemoDeleted> {
  List<bool> deletedCheck = List.generate(3, (index) => false);
  final name = [
    '까먹지 말고 약먹이기 까먹지 말고 약먹이기 까먹지 말고 약먹까먹지 말고 약먹이기까먹지 말고 약먹이기까먹지 말고 약먹이'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < 2; i++)
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CustomContainer(
                  width: 344.w,
                  height: 80.h,
                ),
              ),
              Positioned(
                top: 32.h,
                left: 11.w,
                child: Container(
                  width: 20.w,
                  height: 20.h,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          deletedCheck[i] = !deletedCheck[i];
                        });
                      },
                      child: Image.asset(deletedCheck[i]
                          ? 'assets/alert/check_selected.png'
                          : 'assets/alert/check_default.png')),
                ),
              ),
              Positioned(
                left: 40.w,
                top: 33.h,
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
