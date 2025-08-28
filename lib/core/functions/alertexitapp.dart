import 'dart:io';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "51".tr,
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: AppColor.black,
      ),
      middleText: "52".tr,
      middleTextStyle: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            exit(0);
          },
          padding: const EdgeInsetsDirectional.symmetric(
              vertical: 10, horizontal: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: AppColor.primaryColor,
          textColor: Colors.white,
          child: Text("53".tr),
        ),
        MaterialButton(
          onPressed: () {
            Get.back();
          },
          padding: const EdgeInsetsDirectional.symmetric(
              vertical: 10, horizontal: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: AppColor.primaryColor,
          textColor: Colors.white,
          child: Text("54".tr),
        ),
      ]);
  return Future.value(true);
}
