import 'package:ecommerce_admin_app_php/controller/orders/ordersarchive_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/view/widget/orders/custom_ordersarchivecart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchivePage extends StatelessWidget {
  const OrdersArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Container(
      padding: const EdgeInsets.all(15),
      child: GetBuilder<OrdersArchiveController>(
        builder: (controller) => Handlingdataview(
          statusrequest: controller.statusrequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) => CardOrdersArchiveList(
              ordersModel: controller.data[index],
            ),
          ),
        ),
      ),
    );
  }
}
