import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';

class CustomTabbar extends StatefulWidget {
  final TabController tabController;
  final List<Widget> tabView;
  final String? bannerImage;

  const CustomTabbar({
    super.key,
    required this.tabController,
    required this.tabView,
    this.bannerImage,
  });

  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          dividerHeight: 0,
          unselectedLabelStyle: whiteOpacity(14.sp, FontWeight.w600),
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.values.first,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
          indicatorWeight: 2,
          labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: 'Pretendard'),
          labelColor: Colors.white,
          controller: widget.tabController,
          tabs: [
            Container(
              height: 48.h,
              alignment: Alignment.center,
              child: Text(
                '정보',
              ),
            ),
            Container(
              height: 48.h,
              alignment: Alignment.center,
              child: Text(
                '거래',
              ),
            ),
            Container(
              height: 48.h,
              alignment: Alignment.center,
              child: Text(
                '모임',
              ),
            ),
          ],
        ),
        if (widget.bannerImage != null)
          Image.asset(
            widget.bannerImage!,
          ),
        Expanded(
            child: TabBarView(
                controller: widget.tabController, children: widget.tabView))
      ],
    );
  }
}
