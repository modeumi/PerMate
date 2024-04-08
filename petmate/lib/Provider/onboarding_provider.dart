import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
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
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  void page_change(int value) {
    page = value;
    notifyListeners();
  }
}
