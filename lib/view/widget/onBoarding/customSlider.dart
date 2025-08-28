import 'package:ecommerce_admin_app_php/controller/onBoarding_Controller.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class customSliderOnBoarding extends GetView<onBoardingControllerimp> {
  const customSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder:
          (context, i) => Column(
            children: [
              Image.asset(
                onBoardingList[i].image!,
                // width: 350,
                height: Get.width / 1.3,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 80),
              Text(
                onBoardingList[i].title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: AppColor.black,
                ),
              ),

              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onBoardingList[i].body!,

                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 2,
                    color: AppColor.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
