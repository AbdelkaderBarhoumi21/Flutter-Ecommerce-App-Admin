import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:ecommerce_admin_app_php/controller/items/additems_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app_php/core/functions/validinput.dart';
import 'package:ecommerce_admin_app_php/core/shared/custom_button.dart';
import 'package:ecommerce_admin_app_php/core/shared/custom_dropdownsearrch.dart';
import 'package:ecommerce_admin_app_php/core/shared/custom_textfromfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemsAddPage extends StatelessWidget {
  const ItemsAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddItemsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Items"),
        ),
        body: GetBuilder<AddItemsController>(
          builder: (controller) => Handlingdataview(
            statusrequest: controller.statusrequest,
            widget: Container(
              margin: const EdgeInsets.all(15),
              child: Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    CustomTextFormGlobal(
                      hinText: "Enter your category name ",
                      labelText: "Items Name(English)",
                      iconData: Icons.category_outlined,
                      myController: controller.itemsNameEnConrtoller,
                      validator: (val) {
                        return validInput(val!, 1, 200, "");
                      },
                      isNumber: false,
                    ),
                    CustomTextFormGlobal(
                      hinText: "Enter your category name ",
                      labelText: "Items Name(Arabic) ",
                      iconData: Icons.category_outlined,
                      myController: controller.itemsNameArConrtoller,
                      validator: (val) {
                        return validInput(val!, 1, 200, "");
                      },
                      isNumber: false,
                    ),
                    CustomTextFormGlobal(
                      hinText: "Enter your items description ",
                      labelText: "Description(English) ",
                      iconData: Icons.category_outlined,
                      myController: controller.itemsDescEnConrtoller,
                      validator: (val) {
                        return validInput(val!, 1, 200, "");
                      },
                      isNumber: false,
                    ),
                    CustomTextFormGlobal(
                      hinText: "Enter your items description  ",
                      labelText: "Description(Arabic) ",
                      iconData: Icons.category_outlined,
                      myController: controller.itemsDescArConrtoller,
                      validator: (val) {
                        return validInput(val!, 1, 200, "");
                      },
                      isNumber: false,
                    ),
                    CustomTextFormGlobal(
                      hinText: "Enter your items Price ",
                      labelText: "Price",
                      iconData: Icons.category_outlined,
                      myController: controller.itemsPricConrtoller,
                      validator: (val) {
                        return validInput(val!, 1, 30, "");
                      },
                      isNumber: true,
                    ),
                    CustomTextFormGlobal(
                      hinText: "Enter your items discount ",
                      labelText: "Discount",
                      iconData: Icons.category_outlined,
                      myController: controller.itemsDiscountConrtoller,
                      validator: (val) {
                        return validInput(val!, 1, 30, "");
                      },
                      isNumber: true,
                    ),
                    CustomTextFormGlobal(
                      hinText: "Enter your items discount ",
                      labelText: "Count",
                      iconData: Icons.category_outlined,
                      myController: controller.itemsCountConrtoller,
                      validator: (val) {
                        return validInput(val!, 1, 30, "");
                      },
                      isNumber: true,
                    ),
                    CustomDropdownSearch(
                      title: "Choose Category",
                      listData: controller.dropDownList,
                      dropDownSelectedname: controller.categoriesName,
                      dropDownSelectedId: controller.categoriesid,
                      labelText: "Category",
                      iconData: Icons.arrow_drop_down,
                      onTapIcon: () {},
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: MaterialButton(
                        onPressed: () {
                          controller.showOptionImage();
                        },
                        child: Text("Choose Items image"),
                      ),
                    ),
                    if (controller.file != null)
                      Image.file(
                        controller.file!,
                        width: 80,
                        height: 80,
                      ),
                    CustomButton(
                      text: "Add",
                      onPressed: () {
                        controller.addData();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
