import 'package:ecommerce_admin_app_php/controller/onBoarding_Controller.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/view/widget/onBoarding/customButton.dart';
import 'package:ecommerce_admin_app_php/view/widget/onBoarding/customSlider.dart';
import 'package:ecommerce_admin_app_php/view/widget/onBoarding/dotController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(onBoardingControllerimp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      // appBar: AppBar(title: const Text("Home Page")),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(flex: 4, child: customSliderOnBoarding()),
            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  CustomDotControllerOnBoarding(),
                  Spacer(flex: 2),
                  customButtonOnBoarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
