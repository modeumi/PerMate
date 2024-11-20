import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Widget/custom_widget/circle_container.dart';

class WeightCircle extends StatefulWidget {
  const WeightCircle({super.key});

  @override
  State<WeightCircle> createState() => _WeightCircleState();
}

class _WeightCircleState extends State<WeightCircle> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleContainer(
          width: 96.w,
          height: 96.h,
        ),
        Positioned(
            top: 16.h,
            left: 16.w,
            child: Image.asset('assets/image_asset/record/weight.png')),
        Positioned(
          top: 74.h,
          left: 70.w,
          child: Container(
            width: 24,
            height: 24,
            decoration: ShapeDecoration(
              color: Color(0xFF98A2FF),
              shape: OvalBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.white.withOpacity(0.4000000059604645),
                ),
              ),
            ),
            child: Image.asset('assets/image_asset/record/edit.png'),
          ),
        ),
      ],
    );
  }
}
