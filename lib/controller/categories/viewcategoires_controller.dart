import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/categories/categories_data.dart';
import 'package:ecommerce_admin_app_php/data/model/categories_model.dart';
import 'package:get/get.dart';

class ViewcategoiresController extends GetxController {
  //Crud crud = Crud();
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];
  Statusrequest statusrequest = Statusrequest.none;
  getData() async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await categoriesData.getCategoiresData();
    print("---------------------response: $response");
    statusrequest = handlingData(response);
    if (Statusrequest.sucess == statusrequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  backToHome() {
    Get.offAllNamed(AppRoutes.home);
    return Future.value(false);
  }

  deleteDategories(String categoriesid, String imageName) {
    categoriesData.deleteCategoiresData({
      "categoriesid": categoriesid,
      "imageName": imageName,
    });
    data.removeWhere((element) => "${element.categoriesId}" == categoriesid);
    update();
  }

  goToPageEdit(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoutes.categoriesEdit, arguments: {
      "categoriesmodel": categoriesModel,
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
