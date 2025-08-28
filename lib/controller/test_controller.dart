import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  //Crud crud = Crud();
  TestData testData = TestData(Get.find());

  List data = [];
  late Statusrequest statusrequest;
  getData() async {
    statusrequest = Statusrequest.loading;
    var response = await testData.getData();
    print("---------------------response: $response");
    statusrequest = handlingData(response);
    if (Statusrequest.sucess == statusrequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
