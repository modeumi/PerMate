import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class CommunityWrite extends StatefulWidget {
  const CommunityWrite({super.key});

  @override
  State<CommunityWrite> createState() => _CommunityWriteState();
}

class _CommunityWriteState extends State<CommunityWrite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: CustomAppbar(
          title: '',
        ),
        body: Column(
          children: [
            Image.asset('assets/image_asset/information_details/thumbnail.png'),
            Container(
              width: 360.w,
              height: 480.h,
              decoration: BoxDecoration(
                color: Color(0x9900287C),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 2,
                    offset: Offset(2, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
