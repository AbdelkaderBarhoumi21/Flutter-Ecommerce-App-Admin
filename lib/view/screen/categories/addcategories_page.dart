import 'package:ecommerce_admin_app_php/controller/categories/addcategoires_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app_php/core/functions/uploadfile.dart';
import 'package:ecommerce_admin_app_php/core/functions/validinput.dart';
import 'package:ecommerce_admin_app_php/core/shared/custom_button.dart';
import 'package:ecommerce_admin_app_php/core/shared/custom_textfromfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesAddPage extends StatelessWidget {
  const CategoriesAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddcategoiresController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Category"),
        ),
        body: GetBuilder<AddcategoiresController>(
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
                      labelText: "Category Name(English)",
                      iconData: Icons.category_outlined,
                      myController: controller.categoriesNameEnConrtoller,
                      validator: (val) {
                        return validInput(val!, 1, 30, "");
                      },
                      isNumber: false,
                    ),
                    CustomTextFormGlobal(
                      hinText: "Enter your category name ",
                      labelText: "Category Name(Arabic) ",
                      iconData: Icons.category_outlined,
                      myController: controller.categoriesNameArConrtoller,
                      validator: (val) {
                        return validInput(val!, 1, 30, "");
                      },
                      isNumber: false,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: MaterialButton(
                        onPressed: () {
                          controller.chooseImage();
                        },
                        child: Text("Choose category image"),
                      ),
                    ),
                    if (controller.file != null)
                      SvgPicture.file(controller.file!),
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
