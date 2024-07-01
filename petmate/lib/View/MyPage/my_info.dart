import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/custom_container.dart';
import 'package:petmate/Widget/custom_container2.dart';
import 'package:petmate/Widget/custom_tabbar.dart';
import 'package:petmate/Widget/mypage/my_write/deal.dart';
import 'package:petmate/Widget/mypage/my_write/info.dart';
import 'package:petmate/Widget/mypage/my_write/meet.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({super.key});

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: '내 정보',
      ),
      body: Container(
          width: 360.w,
          height: 800.h,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Main/Background.png'),
                  fit: BoxFit.fill)),
          child: Stack(
            children: [
              Positioned(
                top: 296.h,
                left: 8.w,
                child: CustomContainer2(
                  width: 344,
                  height: 428,
                ),
              ),
            ],
          )),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
