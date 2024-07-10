import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/View/MyPage/my_post_delete.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/custom_widget/custom_tabbar.dart';
import 'package:petmate/Widget/mypage/my_write/deal.dart';
import 'package:petmate/Widget/mypage/my_write/info.dart';
import 'package:petmate/Widget/mypage/my_write/meet.dart';

class MyPost extends StatefulWidget {
  const MyPost({super.key});

  @override
  State<MyPost> createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> with SingleTickerProviderStateMixin {
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
            onTap: () {
              Get.to(() => MyPostDelete());
            },
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
