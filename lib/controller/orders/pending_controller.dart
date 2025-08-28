import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/core/services/services.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/orders/ordersapprove_data.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/orders/orderspending_data.dart';
import 'package:ecommerce_admin_app_php/data/model/orders_model.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController {
  List<OrdersModel> data = [];
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());
  OrdersApproveData ordersApproveData = OrdersApproveData(Get.find());
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

  getOrdersPending() async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await ordersPendingData.getPendingOrdersData();
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

  approveOrders(String userid, String orderid) async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await ordersApproveData.ordersApproveData(
      userid,
      orderid,
    );
    print("---------------------response: $response");
    statusrequest = handlingData(response);
    if (Statusrequest.sucess == statusrequest) {
      if (response['status'] == "success") {
        refreshOrder();
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  refreshOrder() {
    getOrdersPending();
  }

  @override
  void onInit() {
    getOrdersPending();
    super.onInit();
  }
}
