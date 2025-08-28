import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/core/services/services.dart';
import 'package:ecommerce_admin_app_php/data/datasource/static/static.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class Onboardingcontroller extends GetxController {
  next();

  onPageChanged(int index);
}

class onBoardingControllerimp extends Onboardingcontroller {
  int currentPage = 0;
  late PageController pageController;
  MyServices mySrvices = Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      mySrvices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(microseconds: 1000),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onClose() {
    pageController.dispose(); // Évite les fuites mémoire
    super.onClose();
  }

  @override
  void onInit() {
    pageController = PageController();
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
}
