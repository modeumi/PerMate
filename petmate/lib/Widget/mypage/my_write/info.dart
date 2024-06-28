import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/Util/textstyles.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12.h,
        ),
        GlassContainer(
          width: 344.w,
          height: 120.h,
          color: Color(0x9900287C),
          gradient: LinearGradient(
            colors: [
              Color(0x9900287C),
              Color(0x9900287C),
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
          borderRadius: BorderRadius.circular(10),
          borderWidth: 1.0,
          elevation: 0,
          boxShadow: [
            BoxShadow(
              color: Color(0x4C000000),
              blurRadius: 10,
              offset: Offset(2, 2),
              spreadRadius: 0,
            )
          ],
          child: Stack(
            children: [
              Positioned(
                  top: 12.h,
                  left: 12.w,
                  child: Image.asset(
                      'assets/image_asset/artice_writing/information_default.png')),
              Positioned(
                  top: 11.h,
                  left: 32.w,
                  child: Text(
                    '정보',
                    style: White(12.sp, FontWeight.w500),
                  )),
              Positioned(
                  top: 9.h,
                  left: 60.w,
                  child: SizedBox(
                    width: 10.w,
                    height: 12.h,
                    child: Text(
                      '·',
                      style: whiteOpacity(14.sp, FontWeight.w600),
                    ),
                  )),
              Positioned(
                  top: 12.h,
                  left: 74.w,
                  child: Text(
                    '5분전',
                    style: whiteOpacity(10.sp, FontWeight.w500),
                  )),
              Positioned(
                  top: 32.h,
                  left: 12.w,
                  child: Container(
                    width: 232.w,
                    child: Text(
                      '강아지가 가구를 물어뜯는 이유 아시나요?',
                      overflow: TextOverflow.ellipsis,
                      style: White(14.sp, FontWeight.w600),
                    ),
                  )),
              Positioned(
                  top: 57.h,
                  left: 12.w,
                  child: Container(
                    width: 232.w,
                    height: 24.h,
                    child: Text(
                      '강아지가 가구를 물어뜯는 이유를 아시나요? 강아지들은 성',
                      overflow: TextOverflow.ellipsis,
                      style: White(10.sp, FontWeight.w500),
                    ),
                  )),
              Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: Container(
                    width: 76.w,
                    height: 76.h,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(-0.00, 1.00),
                        end: Alignment(0, -1),
                        colors: [Colors.black.withOpacity(0), Colors.black],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        'assets/image_asset/information_screen/thumbnail (1).png',
                        width: 76.w,
                        height: 76.h,
                      ),
                    ),
                  )),
              Positioned(
                  top: 96.h,
                  left: 12.w,
                  child: Container(
                    width: 12.w,
                    height: 12.h,
                    child: ClipOval(
                      child: Image.asset(
                          'assets/image_asset/artice_writing/thumbnail.png'),
                    ),
                  )),
              Positioned(
                  top: 94.h,
                  left: 28.w,
                  child: Container(
                    width: 80.w,
                    height: 12.h,
                    child: Text(
                      '강아지',
                      style: White(10.sp, FontWeight.w500),
                    ),
                  )),
              Positioned(
                  top: 96.h,
                  left: 208.w,
                  child: Image.asset(
                      'assets/image_asset/information_details/like.png')),
              Positioned(
                  top: 96.h,
                  left: 224.w,
                  child: SizedBox(
                    width: 20,
                    child: Center(
                      child: Text(
                        '999',
                        style: White(10.sp, FontWeight.w600),
                      ),
                    ),
                  )),
              Positioned(
                  top: 96.h,
                  left: 252.w,
                  child: Image.asset(
                      'assets/image_asset/information_details/view.png')),
              Positioned(
                  top: 96.h,
                  right: 56.w,
                  child: SizedBox(
                    width: 20,
                    child: Center(
                      child: Text(
                        '999',
                        style: White(10.sp, FontWeight.w600),
                      ),
                    ),
                  )),
              Positioned(
                  top: 96.h,
                  right: 36.w,
                  child: Image.asset(
                      'assets/image_asset/information_details/comment.png')),
              Positioned(
                  top: 96.h,
                  right: 12.w,
                  child: SizedBox(
                    width: 20,
                    child: Center(
                      child: Text(
                        '999',
                        style: White(10.sp, FontWeight.w600),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
