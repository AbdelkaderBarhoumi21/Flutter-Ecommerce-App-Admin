import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_app_php/controller/items/viewitems_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsViewPage extends StatelessWidget {
  const ItemsViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewItemsController());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.itemsAdd);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text("items"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
            child: GetBuilder<ViewItemsController>(
                builder: (controller) => Handlingdataview(
                    statusrequest: controller.statusrequest,
                    widget: WillPopScope(
                      onWillPop: () {
                        return controller.backToHome();
                      },
                      child: Container(
                        child: ListView.builder(
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  controller.goToPageEdit(controller.data[index]);
                                },
                                child: Card(
                                    color: AppColor.backgroundcolor,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            child: CachedNetworkImage(
                                                height: 80,
                                                imageUrl:
                                                    "${AppLink.imageItems}/${controller.data[index].itemsImage}"),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: ListTile(
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    Get.defaultDialog(
                                                        title: "Warning",
                                                        middleText:
                                                            "Are you sure you want to delete this category",
                                                        onCancel: () {},
                                                        onConfirm: () {
                                                          controller
                                                              .deleteItems(
                                                            "${controller.data[index].itemsId}",
                                                            "${controller.data[index].itemsImage}",
                                                          );
                                                          Get.back();
                                                        });
                                                  },
                                                  icon: Icon(Icons
                                                      .delete_outline_outlined),
                                                ),
                                              ],
                                            ),
                                            title: Text(
                                              "${controller.data[index].itemsName}",
                                            ),
                                            subtitle: Text(
                                              "${controller.data[index].categoriesName}",
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              );
                            }),
                      ),
                    )))),
      ),
    );
  }
}
