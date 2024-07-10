import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/MyPage/my_like.dart';
import 'package:petmate/View/MyPage/my_post.dart';
import 'package:petmate/Widget/custom_container.dart';

class MypageWrite extends StatefulWidget {
  const MypageWrite({super.key});

  @override
  State<MypageWrite> createState() => _MypageWriteState();
}

class _MypageWriteState extends State<MypageWrite> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomContainer(
            width: 344.w, height: 72.h, shadow_color: Color(0x26000000)),
        Positioned(
          top: 13.h,
          left: 36.w,
          child: GestureDetector(
            onTap: () {
              Get.to(() => MyPost());
            },
            child: Container(
              width: 100.w,
              height: 44.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/image_asset/mypage/contents_mine.png'),
                  Text(
                    '내 게시글',
                    style: White(12.sp, FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 173.w,
          top: 12.h,
          child: Container(
            width: 2,
            height: 48,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        Positioned(
          top: 13.h,
          right: 36.w,
          child: GestureDetector(
            onTap: () {
              Get.to(() => MyLike());
            },
            child: Container(
              width: 100.w,
              height: 44.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/image_asset/mypage/contents_liked.png'),
                  Text(
                    '좋아요 한 글',
                    style: White(12.sp, FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
