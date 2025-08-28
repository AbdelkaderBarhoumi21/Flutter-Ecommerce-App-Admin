
import 'package:ecommerce_admin_app_php/controller/orders/ordersarchive_controller.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/data/model/orders_model.dart';
import 'package:ecommerce_admin_app_php/view/widget/orders/custom_dialograting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersArchiveList extends GetView<OrdersArchiveController> {
  final OrdersModel ordersModel;
  const CardOrdersArchiveList({
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
                // Text(
                //   "${ordersModel.ordersDatetime}",
                //   style: TextStyle(
                //     fontSize: 15,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
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
              "Order type : ${controller.printOrdertype("${ordersModel.ordersType}")}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
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
            Text(
              "Order Status : ${controller.printOrderStatus("${ordersModel.ordersStatus}")}",
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
                const SizedBox(
                  width: 20,
                ),
                if (ordersModel.ordersRating == 0)
                  MaterialButton(
                    color: AppColor.backgroundcolor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      showDialogRating(context, "${ordersModel.ordersId}");
                    },
                    child: const Text(
                      "Rating",
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
