import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/button/calender_button.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';
import 'package:petmate/Widget/log/calender.dart';
import 'package:petmate/Widget/main/main_alram.dart';
import 'package:petmate/Widget/main/profile.dart';

class LogMain extends StatefulWidget {
  const LogMain({super.key});

  @override
  State<LogMain> createState() => _LogMainState();
}

class _LogMainState extends State<LogMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: 812.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Main/Background.png'),
              fit: BoxFit.fill),
        ),
        child: Container(
          child: Column(
            children: [
              MainAlram(),
              SizedBox(
                height: 8.h,
              ),
              ProfilePlus(),
              SizedBox(
                height: 12.h,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: CustomContainer(
                      width: 344.w,
                      height: 402.h,
                      color: Color(0x3300287C),
                      shadow_color: Color(0x26000000),
                    ),
                  ),
                  Calender(),
                  // Positioned(bottom: -102, child: CommunityButton()),
                ],
              ),
              SizedBox(
                height: 88,
              ),
              CalenderButton()
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
