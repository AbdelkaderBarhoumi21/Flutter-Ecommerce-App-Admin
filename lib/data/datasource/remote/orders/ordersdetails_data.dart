import 'package:ecommerce_admin_app_php/core/class/crud.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';


class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);

  getOrdersDetailsData(String orderid) async {
    var respnse = await crud.postData(AppLink.ordersDetails, {
      "orderid": orderid,
    });
    return respnse.fold((l) => l, (r) => r);
  }
}
