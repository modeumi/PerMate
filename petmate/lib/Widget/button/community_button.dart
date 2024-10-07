import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/View/Community/community_write.dart';

class CommunityButton extends StatefulWidget {
  const CommunityButton({super.key});

  @override
  State<CommunityButton> createState() => _CommunityButtonState();
}

class _CommunityButtonState extends State<CommunityButton> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GlassContainer(
            width: 44.w,
            height: 44.h,
            color: Color(0xff00297C).withOpacity(0.2),
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.white.withOpacity(0.2)],
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
              onTap: () {},
              child: Image.asset(
                "assets/image_asset/information_screen/filter.png",
              ),
            ),
          ),
          GlassContainer(
            width: 240.w,
            height: 44.h,
            color: Color(0xff00297C).withOpacity(0.2),
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.white.withOpacity(0.2)],
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Container(
                    width: 72.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedIndex == 0
                          ? Colors.white
                          : Colors.transparent,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '최신순',
                        style: TextStyle(
                          color: selectedIndex == 0
                              ? Color(0xFF1847A2)
                              : Colors.white.withOpacity(0.6),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                    width: 72.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedIndex == 1
                          ? Colors.white
                          : Colors.transparent,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '좋아요순',
                        style: TextStyle(
                          color: selectedIndex == 1
                              ? Color(0xFF1847A2)
                              : Colors.white.withOpacity(0.6),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                  child: Container(
                    width: 72.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedIndex == 2
                          ? Colors.white
                          : Colors.transparent,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '조회순',
                        style: TextStyle(
                          color: selectedIndex == 2
                              ? Color(0xFF1847A2)
                              : Colors.white.withOpacity(0.6),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: GlassContainer(
              width: 44.w,
              height: 44.h,
              color: Color(0xff00297C).withOpacity(0.2),
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.white.withOpacity(0.2)],
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
                  Get.to(() => CommunityWrite());
                },
                child: Image.asset(
                  "assets/image_asset/information_screen/write.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
