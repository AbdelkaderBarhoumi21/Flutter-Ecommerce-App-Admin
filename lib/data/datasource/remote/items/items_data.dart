import 'dart:io';

import 'package:ecommerce_admin_app_php/core/class/crud.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getItemsData() async {
    var respnse = await crud.postData(AppLink.itemsView, {});
    return respnse.fold((l) => l, (r) => r);
  }

  addItemsData(Map data, File file) async {
    var respnse = await crud.addRequestWithImageOne(
      AppLink.itemssAdd,
      data,
      file,
    );
    return respnse.fold((l) => l, (r) => r);
  }

  editItemsData(Map data, [File? file]) async {
    var respnse;

    if (file == null) {
      respnse = await crud.postData(AppLink.itemsEdit, data);
    } else {
      respnse = await crud.addRequestWithImageOne(
          AppLink.categoriesEdit, data, file);
    }
    return respnse.fold((l) => l, (r) => r);
  }

  deleteItemsData(Map data) async {
    var respnse = await crud.postData(
      AppLink.itemsDelete,
      data,
    );
    return respnse.fold((l) => l, (r) => r);
  }
}
