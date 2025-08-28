import 'package:ecommerce_admin_app_php/controller/orders/pending_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/view/widget/orders/custom_orderspendingcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPendingPage extends StatelessWidget {
  const OrdersPendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Container(
      padding: const EdgeInsets.all(15),
      child: GetBuilder<OrdersPendingController>(
        builder: (controller) => Handlingdataview(
          statusrequest: controller.statusrequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) => CardOrdersList(
              ordersModel: controller.data[index],
            ),
          ),
        ),
      ),
    );
  }
}
