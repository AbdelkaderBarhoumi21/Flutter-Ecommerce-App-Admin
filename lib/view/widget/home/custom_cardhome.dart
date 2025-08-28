import 'package:ecommerce_admin_app_php/controller/orders/orderscreen_controller.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomCardhome extends GetView<OrderscreenControllerImp> {
  final String title;
  final String body;
  const CustomCardhome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                body,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          // Positioned(
          //   top: -20,
          //   right: controller.lang == "en" ? -20 : null,
          //   left: controller.lang == "ar" ? -20 : null,
          //   child: Container(
          //     height: 160,
          //     width: 160,
          //     decoration: BoxDecoration(
          //       color: AppColor.secondColor,
          //       borderRadius: BorderRadius.circular(160),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
