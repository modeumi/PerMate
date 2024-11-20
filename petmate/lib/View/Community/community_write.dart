import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/custom_widget/blue_container.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class CommunityWrite extends StatefulWidget {
  const CommunityWrite({super.key});

  @override
  State<CommunityWrite> createState() => _CommunityWriteState();
}

class _CommunityWriteState extends State<CommunityWrite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: CustomAppbar(
          title: '',
        ),
        body: Column(
          children: [
            Image.asset('assets/image_asset/information_details/thumbnail.png'),
            Container(
              width: 360.w,
              height: 480.h,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 41, 124, 0.60),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    blurRadius: 2,
                    offset: Offset(2, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: 344,
                  height: 205,
                  child: Column(
                    children: [
                      Text(
                        '강아지가 나무를 물어뜯는 이유를 알고 계신가요? 미안하다 이거 보여주려고 어그로 끌었다. 강아지는 진짜 전설이다. 고양이랑 싸움 실화냐 가슴이 웅장해진다.',
                        style: White(16.sp, FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 96,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 12.w,
                                  height: 12.h,
                                  child: ClipOval(
                                    child: Image.asset(
                                        'assets/image_asset/artice_writing/thumbnail.png'),
                                  ),
                                ),
                                Container(
                                  width: 80.w,
                                  height: 12.h,
                                  child: Text(
                                    '강아지',
                                    style: White(10.sp, FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 116,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                    'assets/image_asset/information_details/like.png'),
                                SizedBox(
                                  width: 20.w,
                                  child: Center(
                                    child: Text(
                                      '999',
                                      style: White(10.sp, FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                    'assets/image_asset/information_details/view.png'),
                                SizedBox(
                                  width: 20.w,
                                  child: Center(
                                    child: Text(
                                      '999',
                                      style: White(10.sp, FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                    'assets/image_asset/information_details/comment.png'),
                                SizedBox(
                                  width: 20.w,
                                  child: Center(
                                    child: Text(
                                      '999',
                                      style: White(10.sp, FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Text(
                        '강아지가 나무를 물어뜯는 이유를 아시나요?강아지가 나무를 물어뜯는이유를 아시나요?강아지가 나무를 물어뜯는 이유를 아시나요?',
                        style: White(12.sp, FontWeight.w600),
                      ),
                      BlueContainer(
                        width: 344,
                        height: 166,
                        
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
