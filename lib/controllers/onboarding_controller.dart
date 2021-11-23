import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      //
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/model1.jpg', 'Hoodie',
        'Style is something each of us already has, all we need to do is find it.'),
    OnboardingInfo('assets/model2.jpg', 'Casual Sweatshirt',
        'Fashion is the armor to survive the reality of everyday life.'),
    OnboardingInfo(
        'assets/model4.jpg', 'Shirt', 'The joy of dressing is an art.'),
  ];
}
