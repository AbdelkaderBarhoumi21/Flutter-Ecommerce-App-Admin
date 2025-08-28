import 'package:ecommerce_admin_app_php/controller/home_controller.dart';
import 'package:ecommerce_admin_app_php/core/constant/imageasset.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/view/widget/home/custom_cardadmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            ScreenTypeLayout(
              breakpoints:
                  ScreenBreakpoints(tablet: 600, desktop: 950, watch: 300),
              mobile: Container(
                color: Colors.blue,
                height: 90,
              ),
              tablet: Container(
                color: Colors.yellow,
                height: 100,
              ),
            ),
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getValueForScreenType<int>(
                    context: context,
                    mobile: 1,
                    tablet: 4,
                    desktop: 5,
                  ),
                  childAspectRatio: 0.7,
                  mainAxisExtent: 150),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                CardAdmin(
                  imageUrl: AppImageAsset.categories,
                  title: "Categories",
                  onTap: () {
                    Get.toNamed(AppRoutes.categoriesView);
                  },
                ),
                CardAdmin(
                  imageUrl: AppImageAsset.product,
                  title: "Items",
                  onTap: () {
                    Get.toNamed(AppRoutes.itemsView);
                  },
                ),
                CardAdmin(
                  imageUrl: AppImageAsset.user,
                  title: "Users",
                  onTap: () {},
                ),
                CardAdmin(
                  imageUrl: AppImageAsset.order,
                  title: "Orders",
                  onTap: () {
                    Get.toNamed(AppRoutes.ordersScreen);
                  },
                ),
                CardAdmin(
                  imageUrl: AppImageAsset.report,
                  title: "Report",
                  onTap: () {},
                ),
                CardAdmin(
                  imageUrl: AppImageAsset.notification,
                  title: "Notification",
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
