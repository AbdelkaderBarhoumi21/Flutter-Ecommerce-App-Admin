import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_app_php/controller/categories/viewcategoires_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/core/constant/imageasset.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesViewPage extends StatelessWidget {
  const CategoriesViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewcategoiresController());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.categoriesAdd);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
            child: GetBuilder<ViewcategoiresController>(
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
                                  controller.goToPageEdit(
                                    controller.data[index],
                                  );
                                },
                                child: Card(
                                    color: AppColor.backgroundcolor,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            child: SvgPicture.network(
                                                height: 80,
                                                "${AppLink.imageCategories}/${controller.data[index].categoriesImage}"),
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
                                                              .deleteDategories(
                                                            "${controller.data[index].categoriesId}",
                                                            "${controller.data[index].categoriesImage}",
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
                                              "${controller.data[index].categoriesName}",
                                            ),
                                            subtitle: Text(
                                              "${controller.data[index].categoriesCreate}",
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
