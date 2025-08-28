
import 'package:ecommerce_admin_app_php/controller/orders/ordersdetails_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersdetailsPage extends StatelessWidget {
  const OrdersdetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersdetailsController());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: const Text("Orders Details"),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GetBuilder<OrdersdetailsController>(
              builder: (controller) => Handlingdataview(
                    statusrequest: controller.statusrequest,
                    widget: ListView(
                      children: [
                        Card(
                          color: AppColor.backgroundcolor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                                Table(
                                  children: [
                                    TableRow(
                                      children: [
                                        Text(
                                          "Items",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Qunatity",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Price",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    ...List.generate(
                                      controller.data.length,
                                      (index) => TableRow(
                                        children: [
                                          Text(
                                            "${controller.data[index].itemsName}",
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "${controller.data[index].itemsCount}",
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "${controller.data[index].itemsprice} \$",
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "Total Price : ${controller.ordersModel.ordersTotalprice} \$",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (controller.ordersModel.ordersType == 0)
                          Card(
                            color: AppColor.backgroundcolor,
                            child: ListTile(
                              title: Text(
                                "Shipping Address",
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                  "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}"),
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (controller.ordersModel.ordersType == 0)
                          Card(
                            color: AppColor.backgroundcolor,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              height: 300,
                              width: 300,
                              child: GoogleMap(
                                mapType: MapType.normal,
                                markers: controller.markers.toSet(),
                                initialCameraPosition:
                                    controller.cameraPosition!,
                                onMapCreated:
                                    (GoogleMapController controllermap) {
                                  controller.completerController!
                                      .complete(controllermap);
                                },
                              ),
                            ),
                          )
                      ],
                    ),
                  ))),
    );
  }
}
