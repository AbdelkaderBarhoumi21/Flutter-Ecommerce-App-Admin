import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/core/services/services.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/orders/ordersaccepted_data.dart';
import 'package:ecommerce_admin_app_php/data/model/orders_model.dart';
import 'package:get/get.dart';

class OrdersAcceptedController extends GetxController {
  List<OrdersModel> data = [];
  OrdersAcceptedData ordersAcceptedData = OrdersAcceptedData(Get.find());
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

  getOrdersAccepted() async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await ordersAcceptedData.getAccepetdOrdersData();
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

  donePrepare(String userid, String orderid, String ordertype) async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await ordersAcceptedData.getPreparedOrdersData(
      userid,
      orderid,
      ordertype,
    );
    print("---------------------response: $response");
    statusrequest = handlingData(response);
    if (Statusrequest.sucess == statusrequest) {
      if (response['status'] == "success") {
        getOrdersAccepted();
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  refreshOrder() {
    getOrdersAccepted();
  }

  @override
  void onInit() {
    getOrdersAccepted();
    super.onInit();
  }
}
