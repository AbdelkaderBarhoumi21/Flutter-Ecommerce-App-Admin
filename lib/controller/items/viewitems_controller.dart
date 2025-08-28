import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/items/items_data.dart';
import 'package:ecommerce_admin_app_php/data/model/categories_model.dart';
import 'package:ecommerce_admin_app_php/data/model/items_model.dart';
import 'package:get/get.dart';

class ViewItemsController extends GetxController {
  //Crud crud = Crud();
  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];
  Statusrequest statusrequest = Statusrequest.none;
  getData() async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await itemsData.getItemsData();
    print("---------------------response: $response");
    statusrequest = handlingData(response);
    if (Statusrequest.sucess == statusrequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  deleteItems(String itemsid, String imageName) {
    itemsData.deleteItemsData({
      "itemsid": itemsid,
      "imageName": imageName,
    });
    data.removeWhere((element) => "${element.itemsId}" == itemsid);
    update();
  }

  goToPageEdit(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.itemsEdit, arguments: {
      "itemsmodel": itemsModel,
    });
  }

  backToHome() {
    Get.offAllNamed(AppRoutes.home);
    return Future.value(false);
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
