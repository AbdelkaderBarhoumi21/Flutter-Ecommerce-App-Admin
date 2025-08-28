import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:ecommerce_admin_app_php/controller/categories/viewcategoires_controller.dart';
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

class EditItemsController extends GetxController {
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

  String? active;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  editData() async {
    if (formState.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      Map data = {
        "itemsid": itemsModel!.itemsId.toString(),
        "catId": categoriesid.text,
        "nameEn": itemsNameEnConrtoller.text,
        "nameAr": itemsNameArConrtoller.text,
        "descEn": itemsDescEnConrtoller.text,
        "descAr": itemsDescArConrtoller.text,
        "count": itemsCountConrtoller.text,
        "price": itemsPricConrtoller.text,
        "discount": itemsDiscountConrtoller.text,
        "datenow": DateTime.now().toString(),
        "imageold": itemsModel!.itemsImage,
        "active": active,
      };
      var response = await itemsData.editItemsData(
        data,
        file,
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

  changeStatusActive(val) {
    active = val;
    update();
  }

  @override
  void onInit() {
    itemsModel = Get.arguments['itemsmodel'];
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

    itemsNameEnConrtoller.text = itemsModel!.itemsName!;
    itemsNameArConrtoller.text = itemsModel!.itemsNameAr!;

    itemsDescEnConrtoller.text = itemsModel!.itemsDesc!;
    itemsDescArConrtoller.text = itemsModel!.itemsDescAr!;

    itemsPricConrtoller.text = itemsModel!.itemsPrice!.toString();
    itemsCountConrtoller.text = itemsModel!.itemsCount!.toString();
    itemsDiscountConrtoller.text = itemsModel!.itemsDiscount!.toString();

    dropDownNameConrtoller.text = itemsModel!.itemsName!;
    dropDownIdConrtoller.text = itemsModel!.itemsId!.toString();

    categoriesName.text = itemsModel!.categoriesName!;
    categoriesid.text = itemsModel!.categoriesId!.toString();
    active = itemsModel!.itemsActive.toString();
    super.onInit();
  }
}
