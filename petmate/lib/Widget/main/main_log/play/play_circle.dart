import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Widget/custom_widget/circle_container.dart';

class PlayCircle extends StatefulWidget {
  const PlayCircle({super.key});

  @override
  State<PlayCircle> createState() => _PlayCircleState();
}

class _PlayCircleState extends State<PlayCircle> {
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
            child: Image.asset('assets/image_asset/record/play.png')),
        Positioned(
          top: 74.h,
          left: 70.w,
          child: Container(
            width: 24,
            height: 24,
            decoration: ShapeDecoration(
              color: Color(0xFF7EC1FF),
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
