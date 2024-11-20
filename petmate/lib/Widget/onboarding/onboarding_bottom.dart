import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/onboarding_controller.dart';
import 'package:petmate/View/login_select.dart';

class OnboardingBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (controller) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 160,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xFF1852CC),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                bool status = controller.next_page();
                if (!status) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginSelect(),
                      ));
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                decoration: BoxDecoration(
                    color: const Color(0x3300287C),
                    border: Border.all(
                      width: 1,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x4C000000),
                        blurRadius: 10,
                        offset: Offset(2, 2),
                        spreadRadius: 0,
                      )
                    ]),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.page == 3 ? '펫메이트 시작하기' : '다음',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: controller.page == 3 ? 0 : 8,
                      ),
                      controller.page == 3
                          ? Container()
                          : Image.asset('assets/onboarding/icon_1.png'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Image.asset('assets/onboarding/logo_1.png'),
          ],
        ),
      );
    });
  }
}
