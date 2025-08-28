import 'package:ecommerce_admin_app_php/controller/orders/orderscreen_controller.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/view/widget/home/custom_bottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreenPage extends StatelessWidget {
  const OrderScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderscreenControllerImp());
    return GetBuilder<OrderscreenControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: AppBar(
          title: const Text("Orders"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomappbarhome(),
        body: controller.listpage.elementAt(controller.currentPage),
      ),
    );
  }
}
