import 'package:ecommerce_admin_app_php/controller/orders/accepted_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app_php/view/widget/orders/custom_ordersacceptedcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersAcceptedPage extends StatelessWidget {
  const OrdersAcceptedPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAcceptedController());
    return Container(
      padding: const EdgeInsets.all(15),
      child: GetBuilder<OrdersAcceptedController>(
        builder: (controller) => Handlingdataview(
          statusrequest: controller.statusrequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) => CardAcceptedOrdersList(
              ordersModel: controller.data[index],
            ),
          ),
        ),
      ),
    );
  }
}
