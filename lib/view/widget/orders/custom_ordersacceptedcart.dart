import 'package:ecommerce_admin_app_php/controller/orders/accepted_controller.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/data/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardAcceptedOrdersList extends GetView<OrdersAcceptedController> {
  final OrdersModel ordersModel;
  const CardAcceptedOrdersList({
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
                if (ordersModel.ordersStatus == 1)
                  MaterialButton(
                    color: AppColor.backgroundcolor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      controller.donePrepare(
                          "${ordersModel.ordersUsersid}",
                          "${ordersModel.ordersId}",
                          "${ordersModel.ordersType}");
                    },
                    child: const Text(
                      "Prepare",
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
