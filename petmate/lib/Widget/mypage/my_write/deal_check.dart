import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/Util/textstyles.dart';

class DealCheck extends StatefulWidget {
  const DealCheck({super.key});

  @override
  State<DealCheck> createState() => _DealCheckState();
}

class _DealCheckState extends State<DealCheck> {
  bool like = false;
  bool check = false;
  // final List<Map<String, dynamic>> dealList = [
  //   {
  //     'deal': '판매',
  //     'title': '고양이 사료 로얄캐닌 저렴한 가격에 판매 합니다.',
  //     'subtitle': '강아지가 가구를 물어뜯는 이유를 아시나요? 강아지들은 성',
  //     'address': '동탄2동',
  //     'price': '120,000,000원',
  //     'time': '5분전',
  //     'like': '9',
  //     'view': '99',
  //     'comment': '999',
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10, //item 개수
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
        childAspectRatio: 6 / 9, //item 의 가로 1, 세로 2 의 비율
        mainAxisSpacing: 12, //수평 Padding
        crossAxisSpacing: 8, //수직 Padding
      ),
      itemBuilder: (BuildContext context, int index) {
        //item 의 반목문 항목 형성
        return GlassContainer(
          width: 168.w,
          height: 300.h,
          color: Color(0x9900287C),
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
              Container(
                width: 168.w,
                height: 128.h,
                child: Image.asset(
                  'assets/image_asset/trading_screen/thumbnail (1).png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 100.h,
                left: 8.w,
                child: GlassContainer(
                  width: 52.w,
                  height: 20.h,
                  color: Color(0xCC0043AC),
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
                      blurRadius: 2,
                      offset: Offset(1, 1),
                      spreadRadius: 0,
                    )
                  ],
                  child: Stack(
                    children: [
                      Positioned(
                        top: 2.h,
                        left: 6.w,
                        right: 8.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 14,
                              height: 12,
                              margin: EdgeInsets.only(top: 3),
                              child: Image.asset(
                                'assets/image_asset/transaction_writing/sell_default.png',
                              ),
                            ),
                            Text(
                              '판매',
                              style: White(10.sp, FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        check = !check;
                      });
                    },
                    child: Image.asset(check
                        ? 'assets/image_asset/myarticle_like/check_selected.png'
                        : 'assets/image_asset/myarticle_like/check_default.png'),
                  )),
              Positioned(
                top: 100.h,
                left: 138.w,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      like = !like;
                    });
                  },
                  child: Image.asset(
                    like
                        ? 'assets/image_asset/myarticle_like/like_clicked.png'
                        : 'assets/image_asset/myarticle_like/like_default.png',
                    width: 25.w,
                    height: 25.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 140.h,
                left: 8.w,
                child: Text(
                  '고양이 사료 로얄캐닌 저렴 \n한 가격에 판매 합니다.',
                  style: White(14.sp, FontWeight.w600),
                ),
              ),
              Positioned(
                top: 180.h,
                left: 8.w,
                child: Container(
                  width: 74.w,
                  height: 12.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '동탄2동',
                        style: whiteOpacity(10.sp, FontWeight.w500),
                      ),
                      Text(
                        '·',
                        style: whiteOpacity(10.sp, FontWeight.w500),
                      ),
                      Text(
                        '5분전',
                        style: whiteOpacity(10.sp, FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 200.h,
                left: 8.w,
                child: Text(
                  '120,000,000원',
                  style: White(14.sp, FontWeight.w500),
                ),
              ),
              Positioned(
                  top: 229.h,
                  left: 44.w,
                  child: Image.asset(
                      'assets/image_asset/information_details/like.png')),
              Positioned(
                  top: 229.h,
                  left: 60.w,
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
                  top: 229.h,
                  left: 84.w,
                  child: Image.asset(
                      'assets/image_asset/information_details/view.png')),
              Positioned(
                  top: 229.h,
                  left: 100.w,
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
                  top: 229.h,
                  left: 124.w,
                  child: Image.asset(
                      'assets/image_asset/information_details/comment.png')),
              Positioned(
                  top: 229.h,
                  right: 8.w,
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
        );
      },
    );
  }
}
