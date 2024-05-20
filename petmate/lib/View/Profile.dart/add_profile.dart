import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Notice/noticedelete.dart';
import 'package:petmate/View/mainpage.dart';
import 'package:petmate/Widget/bottom_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/button/deleted_button.dart';
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/notice/notification_type.dart';
import 'package:petmate/Widget/profile/add/add_info.dart';
import 'package:petmate/Widget/profile/add/add_profile.dart';
import 'package:petmate/Widget/profile/deleted/mypet_deleted_widget.dart';
import 'package:petmate/Widget/profile/deleted/mypet_edit_widget.dart';
import 'package:petmate/Widget/profile/deleted/sharepet_deleted_widget.dart';

class AddProfilePage extends StatefulWidget {
  const AddProfilePage({super.key});

  @override
  State<AddProfilePage> createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/Main/Background.png'), fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Container(
              width: double.infinity,
              height: 45,
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset('assets/alert/back.png')),
                  Container(
                    width: 285,
                    child: Text('등록',
                        textAlign: TextAlign.center,
                        style: White(20, FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [AddProfileWidget(), AddInfoWidget()],
            ),
          ),
          CustomBottomNavigationBar()
        ],
      ),
    ));
  }
}
