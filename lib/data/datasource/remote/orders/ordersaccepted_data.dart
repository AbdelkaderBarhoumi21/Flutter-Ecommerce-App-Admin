import 'package:ecommerce_admin_app_php/core/class/crud.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);

  getAccepetdOrdersData() async {
    var respnse = await crud.postData(AppLink.ordersAccepted, {});
    return respnse.fold((l) => l, (r) => r);
  }

  getPreparedOrdersData(String userid, String orderid, String ordertype) async {
    var respnse = await crud.postData(AppLink.ordersPrepare, {
      "userid": userid,
      "orderid": orderid,
      "ordertype": ordertype,
    });
    return respnse.fold((l) => l, (r) => r);
  }
}
