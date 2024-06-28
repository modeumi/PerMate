import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/Util/textstyles.dart';

class Meet extends StatefulWidget {
  const Meet({super.key});

  @override
  State<Meet> createState() => _MeetState();
}

class _MeetState extends State<Meet> {
  bool like = false;
  final List<Map<String, dynamic>> infoList = [
    {
      'info': '정보',
      'title': '강아지가 가구를 물어뜯는 이유 아시나요?',
      'subtitle': '강아지가 가구를 물어뜯는 이유를 아시나요? 강아지들은 성',
      'time': '5분전',
      'like': '9',
      'view': '99',
      'comment': '999',
      'nickname': '강아지'
    }
  ];
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
                  child: Image.asset(
                      'assets/image_asset/meet_screen/thumbnail (1).png')),
              Positioned(
                  top: 11.h,
                  left: 132.w,
                  child: Container(
                    width: 232.w,
                    child: Text(
                      '함께 산책도 하고 동네 친구가 되어보\n아요! 신난다!',
                      overflow: TextOverflow.ellipsis,
                      style: White(14.sp, FontWeight.w600),
                    ),
                  )),
              Positioned(
                  top: 57.h,
                  left: 150.w,
                  child: Container(
                    child: Text(
                      '동탄동탄2동',
                      overflow: TextOverflow.ellipsis,
                      style: White(10.sp, FontWeight.w500),
                    ),
                  )),
              Positioned(
                  left: 132.w,
                  top: 57.h,
                  child: Container(
                    width: 14.w,
                    height: 12.h,
                    child: Image.asset(
                        'assets/image_asset/meet_details/location.png'),
                  )),
              Positioned(
                  left: 132.w,
                  top: 77.h,
                  child: Container(
                    width: 14.w,
                    height: 12.h,
                    child: Image.asset(
                        'assets/image_asset/meet_details/people_small.png'),
                  )),
              Positioned(
                  top: 77.h,
                  left: 150.w,
                  child: Text(
                    '8 / 10',
                    style: White(10.sp, FontWeight.w600),
                  )),
              Positioned(
                  top: 90.h,
                  left: 10.w,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        like = !like;
                      });
                    },
                    child: Image.asset(
                      like
                          ? 'assets/image_asset/meet_details/like_clicked.png'
                          : 'assets/image_asset/meet_details/like_default.png',
                      width: 25,
                      height: 25,
                    ),
                  )),
              Positioned(
                  top: 99.h,
                  left: 132.w,
                  child: Container(
                    width: 12.w,
                    height: 12.h,
                    child: ClipOval(
                      child: Image.asset(
                          'assets/image_asset/artice_writing/thumbnail.png'),
                    ),
                  )),
              Positioned(
                  top: 97.h,
                  left: 148.w,
                  child: Container(
                    width: 80.w,
                    height: 12.h,
                    child: Text(
                      '산책 조아 너무 조아',
                      style: White(10.sp, FontWeight.w500),
                    ),
                  )),
              Positioned(
                  top: 97.h,
                  left: 252.w,
                  child: Image.asset(
                      'assets/image_asset/information_details/like.png')),
              Positioned(
                  top: 96.h,
                  left: 268.w,
                  child: Text(
                    '999',
                    style: White(10.sp, FontWeight.w600),
                  )),
              Positioned(
                  top: 97.h,
                  right: 36.w,
                  child: Image.asset(
                      'assets/image_asset/information_details/comment.png')),
              Positioned(
                  top: 96.h,
                  right: 12.w,
                  child: Text(
                    '999',
                    style: White(10.sp, FontWeight.w600),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
