import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/Util/textstyles.dart';

class HairShop extends StatefulWidget {
  const HairShop({super.key});

  @override
  State<HairShop> createState() => _HairShopState();
}

class _HairShopState extends State<HairShop> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          GlassContainer(
            width: 102.w,
            height: 40.h,
            color: Color(0xCCFF3800),
            gradient: LinearGradient(
              colors: [Color(0xCCFF3800), Color(0xCCFF3800)],
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
                  width: 28,
                  height: 28,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/mapimg/filter (4).png',
                    width: 28,
                    height: 28,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 42.w,
            top: 9.h,
            child: Text('미용실', style: White(16.sp, FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
