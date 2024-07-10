import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/community_controller.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/cummity/community_button.dart';
import 'package:petmate/Widget/cummity/coummunity_searchbar.dart';
import 'package:petmate/Widget/custom_widget/custom_tabbar.dart';
import 'package:petmate/Widget/mypage/my_write/deal.dart';
import 'package:petmate/Widget/mypage/my_write/info.dart';
import 'package:petmate/Widget/mypage/my_write/meet.dart';

class CommunityMain extends StatefulWidget {
  const CommunityMain({super.key});

  @override
  State<CommunityMain> createState() => _CommunityMainState();
}

class _CommunityMainState extends State<CommunityMain>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CommunityController());
    return GetBuilder<CommunityController>(
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          body: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Main/Background.png'),
                    fit: BoxFit.fill)),
            child: Stack(
              children: [
                CoummunitySearchbar(),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: CustomTabbar(
                      bannerImage:
                          'assets/image_asset/information_screen/banner.png',
                      tabController: _tabController,
                      tabView: [Info(), Deal(), Meet()]),
                ),
                Positioned(top: 684, child: CommunityButton()),
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(),
        );
      },
    );
  }
}
