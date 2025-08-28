import 'dart:io';

import 'package:ecommerce_admin_app_php/controller/categories/viewcategoires_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/core/functions/uploadfile.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/categories/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddcategoiresController extends GetxController {
  //Crud crud = Crud();
  CategoriesData categoriesData = CategoriesData(Get.find());

  Statusrequest statusrequest = Statusrequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController categoriesNameEnConrtoller;
  late TextEditingController categoriesNameArConrtoller;
  File? file;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  addData() async {
    if (formState.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please choose image SVG");
      statusrequest = Statusrequest.loading;
      update();
      Map data = {
        "nameEn": categoriesNameEnConrtoller.text,
        "nameAr": categoriesNameArConrtoller.text,
      };
      var response = await categoriesData.addCategoiresData(
        data,
        file!,
      );
      print("---------------------response: $response");
      statusrequest = handlingData(response);
      if (Statusrequest.sucess == statusrequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.categoriesView);
          ViewcategoiresController viewCOntroller = Get.find();
          viewCOntroller.getData();
        } else {
          statusrequest = Statusrequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    categoriesNameArConrtoller = TextEditingController();
    categoriesNameEnConrtoller = TextEditingController();
    super.onInit();
  }
}
