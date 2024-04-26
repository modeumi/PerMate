import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/onboarding_controller.dart';
import 'package:petmate/Widget/onboarding/onboarding_appbar.dart';
import 'package:petmate/Widget/onboarding/onboarding_body.dart';
import 'package:petmate/Widget/onboarding/onboarding_bottom.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    return Scaffold(
      appBar: const OnboardingAppBar(),
      body: GetBuilder<OnboardingController>(builder: (controller) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: PageView.builder(
            controller: controller.pageController,
            onPageChanged: (value) {
              controller.page_change(value);
            },
            itemCount: 4,
            itemBuilder: (context, index) {
              return const OnboardingBody();
            },
          ),
        );
      }),
      bottomSheet: OnboardingBottom(),
    );
  }
}
