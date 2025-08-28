import 'dart:io';

import 'package:ecommerce_admin_app_php/controller/categories/viewcategoires_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/core/functions/uploadfile.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/categories/categories_data.dart';
import 'package:ecommerce_admin_app_php/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditcategoiresController extends GetxController {
  //Crud crud = Crud();
  CategoriesData categoriesData = CategoriesData(Get.find());

  Statusrequest statusrequest = Statusrequest.none;

  CategoriesModel? categoriesModel;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController categoriesNameEnConrtoller;
  late TextEditingController categoriesNameArConrtoller;
  File? file;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  editData() async {
    if (formState.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      Map data = {
        "nameEn": categoriesNameEnConrtoller.text,
        "nameAr": categoriesNameArConrtoller.text,
        "categoriesid": categoriesModel!.categoriesId.toString(),
        "imageold": categoriesModel!.categoriesImage,
      };
      var response = await categoriesData.editCategoiresData(
        data,
        file,
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
    categoriesModel = Get.arguments['categoriesmodel'];
    categoriesNameArConrtoller = TextEditingController();
    categoriesNameEnConrtoller = TextEditingController();
    categoriesNameArConrtoller.text = categoriesModel!.categoriesNameAr!;
    categoriesNameEnConrtoller.text = categoriesModel!.categoriesName!;
    super.onInit();
  }
}
