import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  int page = 0;
  late PageController pageController = PageController();

  bool next_page() {
    int page = pageController.page!.toInt();
    print(page);
    if (page < 3) {
      page++;
      pageController.nextPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInSine);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  void page_change(int value) {
    page = value;
    update();
  }
}
