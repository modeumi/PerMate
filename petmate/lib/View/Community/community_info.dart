import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/community_controller.dart';

class CommunityInfo extends StatefulWidget {
  const CommunityInfo({super.key});

  @override
  State<CommunityInfo> createState() => _CommunityInfoState();
}

class _CommunityInfoState extends State<CommunityInfo> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommunityController>(builder: (controller) {
      return ListView(
        children: [],
      );
    });
  }
}
