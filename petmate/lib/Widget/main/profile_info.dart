import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return Container(
      width: double.infinity,
      height: 72,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 72,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: GradientBoxBorder(
                width: 1,
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.2)
                  ],
                ),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: BlurryContainer(
              blur: 12,
              elevation: 0,
              borderRadius: BorderRadius.circular(10),
              child: Container(),
            ),
          ),
          Opacity(
            opacity: 0.4,
            child: Container(
              margin: EdgeInsets.all(8),
              width: double.infinity,
              height: 72,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    )
                  ],
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Positioned(
              left: 8,
              child: Container(
                  child:
                      Image.asset('assets/banner/InformationBanner (1).png'))),
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
                  size: Size(4, 4),
                  activeSize: Size(4, 4),
                  spacing: EdgeInsets.only(right: 3)),
            ),
          ),
          Positioned(
              top: 8,
              left: 24,
              child: Text('정보', style: Black(12, FontWeight.w500))),
          Positioned(
            top: 8,
            right: 17,
            child: Container(
              width: 42,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('더보기', style: Black(10, FontWeight.w600)),
                  Image.asset('assets/Main/left.png')
                ],
              ),
            ),
          ),
          Positioned(
              left: 38, top: 28, child: Image.asset('assets/Main/bigleft.png')),
          Positioned(
            left: 49,
            top: 30,
            child: Container(
              width: 265,
              height: 27,
              child: PageView.builder(
                controller: _controller,
                itemCount: textList.length,
                itemBuilder: (context, index) {
                  return CarouselSlider(
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      height: 50,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                    items: textList.map((text) {
                      return Builder(builder: (BuildContext context) {
                        return Column(
                          children: [
                            Text(
                              text,
                              style: Black(14, FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        );
                      });
                    }).toList(),
                  );
                },
              ),
            ),
          ),
          Positioned(
              left: 320,
              top: 28,
              child: Image.asset('assets/Main/bigright.png')),
        ],
      ),
    );
  }
}
