import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/community_controller.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/search_appbar.dart';

class CommunityMain extends StatefulWidget {
  const CommunityMain({super.key});

  @override
  State<CommunityMain> createState() => _CommunityMainState();
}

class _CommunityMainState extends State<CommunityMain> {
  @override
  Widget build(BuildContext context) {
    Get.put(CommunityController());
    return GetBuilder<CommunityController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Main/Background.png'),
                    fit: BoxFit.fill)),
            child: Stack(
              children: [
                SearchAppbar(actions: [], change: (){}, finish: (){}),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CustomBottomNavigationBar())
              ],
            ),
          ),
        );
      },
    );
  }
}
