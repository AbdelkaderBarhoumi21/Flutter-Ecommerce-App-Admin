import 'package:ecommerce_admin_app_php/controller/orders/pending_controller.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/data/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel ordersModel;
  const CardOrdersList({
    super.key,
    required this.ordersModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.backgroundcolor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number : ${ordersModel.ordersId}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  Jiffy.parse(ordersModel.ordersDatetime!).fromNow(),
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(),
            // Text(
            //   "Order type : ${controller.printOrdertype("${ordersModel.ordersType}")}",
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            Text(
              "Order price : ${ordersModel.ordersPrice} \$",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Delivery price : ${ordersModel.ordersPricedelivery} \$",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Payment method : ${controller.printPaymenetMethod("${ordersModel.ordersPaymentmethod}")}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            Row(
              children: [
                Text(
                  "Total price : ${ordersModel.ordersTotalprice} \$",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
                Spacer(),
                MaterialButton(
                  color: AppColor.backgroundcolor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    Get.toNamed(AppRoutes.ordersDetails, arguments: {
                      "ordersmodel": ordersModel,
                    });
                  },
                  child: const Text(
                    "Details",
                    style: TextStyle(color: AppColor.primaryColor),
                  ),
                ),
                const SizedBox(width: 20),
                if (ordersModel.ordersStatus == 0)
                  MaterialButton(
                    color: AppColor.backgroundcolor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      controller.approveOrders("${ordersModel.ordersUsersid}",
                          "${ordersModel.ordersId}");
                    },
                    child: const Text(
                      "Approve",
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
