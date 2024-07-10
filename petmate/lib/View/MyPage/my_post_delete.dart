import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/button/deletedbutton/my_info_deleted.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/custom_widget/custom_tabbar.dart';
import 'package:petmate/Widget/mypage/my_write/deal_check.dart';
import 'package:petmate/Widget/mypage/my_write/info_check.dart';
import 'package:petmate/Widget/mypage/my_write/meet_check.dart';

class MyPostDelete extends StatefulWidget {
  const MyPostDelete({super.key});

  @override
  State<MyPostDelete> createState() => _MyPostDeleteState();
}

class _MyPostDeleteState extends State<MyPostDelete>
    with SingleTickerProviderStateMixin {
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
        title: '내 게시글',
        action: [
          Container(),
          GestureDetector(
            onTap: () {},
            child: Image.asset('assets/alert/delete(24).png'),
          )
        ],
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
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: CustomTabbar(tabController: _tabController, tabView: [
                  InfoCheck(),
                  DealCheck(),
                  MeetCheck(),
                ]),
              ),
              Positioned(left: 8, bottom: 75, child: MyInfoDeleted())
            ],
          )),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
