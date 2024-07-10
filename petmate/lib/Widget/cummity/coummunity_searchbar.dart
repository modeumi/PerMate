import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Main/Notice/notice.dart';
import 'package:petmate/Widget/cummity/community_button.dart';

class CoummunitySearchbar extends StatefulWidget {
  const CoummunitySearchbar({
    super.key,
  });

  @override
  State<CoummunitySearchbar> createState() => _CoummunitySearchbarState();
}

class _CoummunitySearchbarState extends State<CoummunitySearchbar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 30.h,
          left: 8.w,
          child: Container(
            width: 344.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlassContainer(
                  width: 296.w,
                  height: 40.h,
                  color: Color(0xff00297C).withOpacity(0.2),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.10, 0.30, 0.40, 0.0],
                  ),
                  blur: 12,
                  borderRadius: BorderRadius.circular(20.r),
                  borderWidth: 1.w,
                  elevation: 0,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    )
                  ],
                  shadowColor: Color(0x26000000),
                ),
                GlassContainer(
                    width: 40.w,
                    height: 40.h,
                    color: Color(0xff00297C).withOpacity(0.2),
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.white.withOpacity(0.2)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderGradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.2),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.10, 0.30, 0.40, 0.0],
                    ),
                    blur: 12,
                    borderRadius: BorderRadius.circular(20.r),
                    borderWidth: 1.w,
                    elevation: 0,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 2,
                        offset: Offset(2, 2),
                      )
                    ],
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => NoticePage());
                      },
                      child: Image.asset(
                        "assets/Main/notification.png",
                      ),
                    )),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10.w,
          top: 38.h,
          child: Container(
            width: 296.w,
            height: 24.h,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: '검색어를 입력해주세요.',
                  hintStyle: whiteOpacity(14.sp, FontWeight.w600),
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none)),
              style: TextStyle(color: Colors.white, decorationThickness: 0),
              cursorColor: Colors.white,
              cursorWidth: 1.w,
            ),
          ),
        ),
        Positioned(
          top: 38.h,
          left: 268.w,
          child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                  'assets/image_asset/information_screen/search.png')),
        ),
      ],
    );
  }
}
