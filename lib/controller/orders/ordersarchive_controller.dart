import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/core/services/services.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/orders/ordersarchive_data.dart';
import 'package:ecommerce_admin_app_php/data/model/orders_model.dart';
import 'package:get/get.dart';

class OrdersArchiveController extends GetxController {
  List<OrdersModel> data = [];
  OrderArchiveData orderArchiveData = OrderArchiveData(Get.find());
  @override
  Statusrequest statusrequest = Statusrequest.none;
  MyServices myServices = Get.find();

  String printOrdertype(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymenetMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared ";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrderArchive() async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await orderArchiveData.getOrderArchiveData(
    );
    print("---------------------response: $response");
    statusrequest = handlingData(response);
    if (Statusrequest.sucess == statusrequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  refreshOrder() {
    getOrderArchive();
  }



  @override
  void onInit() {
    getOrderArchive();
    super.onInit();
  }
}
