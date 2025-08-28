import 'dart:io';
import 'package:ecommerce_admin_app_php/core/class/crud.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);

  getCategoiresData() async {
    var response = await crud.postData(AppLink.categoriesView, {});
    return response.fold((l) => l, (r) => r);
  }

  addCategoiresData(Map data, File file) async {
    var response = await crud.addRequestWithImageOne(
      AppLink.categoriesAdd,
      data,
      file,
    );
    return response.fold((l) => l, (r) => r);
  }

  editCategoiresData(Map data, [File? file]) async {
    var response;

    if (file == null) {
      response = await crud.postData(AppLink.categoriesEdit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.categoriesEdit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  deleteCategoiresData(Map data) async {
    var response = await crud.postData(
      AppLink.categoriesDelete,
      data,
    );
    return response.fold((l) => l, (r) => r);
  }
}
