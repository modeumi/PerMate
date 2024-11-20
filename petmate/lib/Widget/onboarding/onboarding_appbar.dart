import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/onboarding_controller.dart';
import 'package:petmate/View/login_select.dart';

class OnboardingAppBar extends StatefulWidget implements PreferredSizeWidget {
  const OnboardingAppBar({super.key});

  @override
  State<OnboardingAppBar> createState() => _OnboardingAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _OnboardingAppBarState extends State<OnboardingAppBar> {
  OnboardingController controller = Get.find<OnboardingController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Container(
              width: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 4; i++)
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(
                              controller.page == i ? 0xFF316BD5 : 0xFFCECECE)),
                    ),
                ],
              ),
            ),
          ),
          actions: [
            Opacity(
              opacity: 0.50,
              child: GestureDetector(
                onTap: () {
                  controller.page_change(0);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginSelect(),
                      ));
                },
                child: Container(
                  child: const Text(
                    '건너뛰기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
          leading: Container(),
        ),
      );
    });
  }
}
