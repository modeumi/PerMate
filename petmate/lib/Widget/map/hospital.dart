import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/Util/textstyles.dart';

class HospitalWidget extends StatefulWidget {
  const HospitalWidget({super.key});

  @override
  State<HospitalWidget> createState() => _HospitalWidgetState();
}

class _HospitalWidgetState extends State<HospitalWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      setState(() {
          Image.asset('assets/mapimg/pin (1).png');
      });
      },
      child: Stack(
        children: [
          GlassContainer(
            width: 88.w,
            height: 40.h,
            color: Color(0xCCFF2777),
            gradient: LinearGradient(
              colors: [
                Color(0xCCFF2777),
                Color(0xCCFF2777),
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
              stops: [0.10, 0.30, 0.40, 0.0],
            ),
            blur: 12,
            borderRadius: BorderRadius.circular(20),
            borderWidth: 1.0,
            elevation: 0,
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          Positioned(
            left: 8.w,
            top: 6.h,
            child: Row(
              children: [
                Container(
                  width: 28.w,
                  height: 28.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Color(0xFFE51C67),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(
                    'assets/mapimg/filter (2).png',
                    width: 28.w,
                    height: 28.h,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 88.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          Positioned(
            left: 42.w,
            top: 9.h,
            child: Text('병원', style: White(16.sp, FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
