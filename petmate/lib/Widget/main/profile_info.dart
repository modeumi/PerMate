import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class ProfileInfoWidget extends StatefulWidget {
  const ProfileInfoWidget({super.key});

  @override
  State<ProfileInfoWidget> createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {
  int _currentPage = 0;
  final PageController _controller = PageController();
  final CarouselController _carouselController = CarouselController();
  final List<String> textList = [
    '강아지가 가구를 물어뜯는 이유를 알고 계신가요?',
    '고양이의 하루 평균 수면시간은 몇시간 일까요?',
    '강아지가 가구를 물어뜯는 이유를 알고 계신가요?',
    '고양이의 하루 평균 수면시간은 몇시간 일까요?',
    '강아지가 가구를 물어뜯는 이유를 알고 계신가요?',
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 344.w,
          height: 72.h,
          margin: EdgeInsets.symmetric(
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            border: GradientBoxBorder(
              width: 1.w,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.2)
                ],
              ),
            ),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.8),
          ),
          child: BlurryContainer(
            blur: 12,
            elevation: 0,
            borderRadius: BorderRadius.circular(10),
            child: Container(),
          ),
        ),
        Opacity(
          opacity: 0.8,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            width: 344.w,
            height: 72.h,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 2.r,
                    offset: Offset(2, 2),
                  )
                ],
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10.r)),
          ),
        ),
        Positioned(
          top: 15,
          left: 0,
          child: Container(
            width: 360.w,
            height: 77.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(40)),
                  child: Image.asset(
                    'assets/Main/dog.png',
                    width: 60.w,
                    height: 60.h,
                  ),
                ),
                ClipRRect(
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(42)),
                  child: Image.asset(
                    'assets/Main/cat.png',
                    width: 60.w,
                    height: 60.h,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 160,
          child: DotsIndicator(
            dotsCount: textList.length,
            position: _currentPage,
            mainAxisAlignment: MainAxisAlignment.center,
            decorator: DotsDecorator(
                color: Colors.black.withOpacity(0.4),
                activeColor: Colors.black,
                size: const Size(4, 4),
                activeSize: const Size(4, 4),
                spacing: const EdgeInsets.only(right: 4)),
          ),
        ),
        Positioned(
            top: 6,
            left: 18,
            child: Text('정보', style: Black(12.sp, FontWeight.w500))),
        Positioned(
          top: 6,
          right: 18,
          child: SizedBox(
            width: 42.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('더보기', style: Black(10.sp, FontWeight.w600)),
                Image.asset(
                  'assets/Main/left.png',
                  width: 12.w,
                  height: 12.h,
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 30,
          child: Container(
            width: 295.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/Main/bigleft.png',
                  width: 24.w,
                  height: 24.h,
                ),
                Image.asset('assets/Main/bigright.png')
              ],
            ),
          ),
        ),
        Positioned(
          left: 44,
          top: 25,
          child: SizedBox(
              width: 275.w,
              height: 27.h,
              child: CarouselSlider.builder(
                  itemCount: textList.length,
                  itemBuilder: (context, index, realIdx) {
                    return Center(
                      child: Text(
                        textList[index],
                        style: Black(14.sp, FontWeight.w500),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 50.h,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    viewportFraction: 10,
                    autoPlayInterval: const Duration(seconds: 5),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                  ))),
        ),
      ],
    );
  }
}
