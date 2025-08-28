import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:ecommerce_admin_app_php/controller/items/viewitems_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/core/functions/uploadfile.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/categories/categories_data.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/items/items_data.dart';
import 'package:ecommerce_admin_app_php/data/model/categories_model.dart';
import 'package:ecommerce_admin_app_php/data/model/categoryselectedList_model.dart';
import 'package:ecommerce_admin_app_php/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drop_down_list/drop_down_list.dart';

class AddItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  List<ItemsModel> data = [];
  ItemsModel? itemsModel;
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<SelectedListItem<CategorySelectedListModel>> dropDownList = [];

  List<CategoriesModel> dataCategories = [];
  Statusrequest statusrequest = Statusrequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController itemsNameEnConrtoller;
  late TextEditingController itemsNameArConrtoller;
  late TextEditingController itemsDescEnConrtoller;
  late TextEditingController itemsDescArConrtoller;
  late TextEditingController itemsPricConrtoller;
  late TextEditingController itemsCountConrtoller;
  late TextEditingController itemsDiscountConrtoller;

  late TextEditingController dropDownNameConrtoller;
  late TextEditingController dropDownIdConrtoller;
  late TextEditingController categoriesid;
  late TextEditingController categoriesName;
  File? file;

  showOptionImage() async {
    file = await showbottomMenu(chooseImageCamera, chooseImageGallery);
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(false);
    update();
  }

  chooseImageCamera() async {
    file = await imageuploadCamera();
    update();
  }

  addData() async {
    if (formState.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please choose image");
      statusrequest = Statusrequest.loading;
      update();
      Map data = {
        "catId": categoriesid.text,
        "nameEn": itemsNameEnConrtoller.text,
        "nameAr": itemsNameArConrtoller.text,
        "descEn": itemsDescEnConrtoller.text,
        "descAr": itemsDescArConrtoller.text,
        "count": itemsCountConrtoller.text,
        "price": itemsPricConrtoller.text,
        "discount": itemsDiscountConrtoller.text,
        "datenow": DateTime.now().toString(),
      };
      var response = await itemsData.addItemsData(
        data,
        file!,
      );
      print("---------------------response: $response");
      statusrequest = handlingData(response);
      if (Statusrequest.sucess == statusrequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.itemsView);
          ViewItemsController viewitemsCOntroller = Get.find();
          viewitemsCOntroller.getData();
        } else {
          statusrequest = Statusrequest.failure;
        }
      }
      update();
    }
  }

  getCategoriesData() async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await categoriesData.getCategoiresData();
    print("---------------------response: $response");
    statusrequest = handlingData(response);
    if (Statusrequest.sucess == statusrequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataCategories.addAll(listdata.map((e) => CategoriesModel.fromJson(e)));
        for (int i = 0; i < dataCategories.length; i++) {
          dropDownList.add(
            SelectedListItem<CategorySelectedListModel>(
              data: CategorySelectedListModel(
                name: "${dataCategories[i].categoriesName}",
                id: "${dataCategories[i].categoriesId}",
              ),
            ),
          );
        }
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getCategoriesData();

    itemsNameEnConrtoller = TextEditingController();
    itemsNameArConrtoller = TextEditingController();
    itemsDescEnConrtoller = TextEditingController();
    itemsDescArConrtoller = TextEditingController();
    itemsPricConrtoller = TextEditingController();
    itemsCountConrtoller = TextEditingController();
    itemsDiscountConrtoller = TextEditingController();
    dropDownNameConrtoller = TextEditingController();
    dropDownIdConrtoller = TextEditingController();
    categoriesName = TextEditingController();
    categoriesid = TextEditingController();
    super.onInit();
  }
}
