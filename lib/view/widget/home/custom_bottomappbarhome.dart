import 'package:ecommerce_admin_app_php/controller/orders/orderscreen_controller.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/view/widget/home/custombutton_appbar.dart';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomBottomappbarhome extends StatelessWidget {
  const CustomBottomappbarhome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderscreenControllerImp>(
      builder: (controller) => BottomAppBar(
        height: 70,
        color: AppColor.backgroundcolor,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(controller.listpage.length, (index) {
              return Expanded(
                child: CustombuttonAppbar(
                  onPressed: () {
                    controller.changePage(index);
                  },
                  textButton: controller.bottomAppBar[index]['title'],
                  iconButton: controller.bottomAppBar[index]['icon'],
                  active: controller.currentPage == index ? true : false,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
