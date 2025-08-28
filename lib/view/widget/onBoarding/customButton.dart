import 'package:ecommerce_admin_app_php/controller/onBoarding_Controller.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customButtonOnBoarding extends GetView<onBoardingControllerimp> {
  const customButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 100,
          vertical: 0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          // side: BorderSide(color: Colors.red, width: 4),
        ),

        onPressed: () {
          controller.next();
        },
        color: AppColor.primaryColor,
        child: Text(
          "8".tr,
          style: TextStyle(
            color: AppColor.backgroundcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
