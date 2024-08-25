import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/custom_widget/custom_tabbar.dart';
import 'package:petmate/Widget/mypage/my_write/deal.dart';
import 'package:petmate/Widget/mypage/my_write/info.dart';
import 'package:petmate/Widget/mypage/my_write/meet.dart';

class MyLike extends StatefulWidget {
  const MyLike({super.key});

  @override
  State<MyLike> createState() => _MyLikeState();
}

class _MyLikeState extends State<MyLike> with SingleTickerProviderStateMixin {
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
        title: '좋아요 한 글',
        
      ),
      body: Container(
          width: 360.w,
          height: 800.h,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Main/Background.png'),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.only(top: 90),
            child: CustomTabbar(
                tabController: _tabController,
                tabView: [Info(), Deal(), Meet()]),
          )),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
