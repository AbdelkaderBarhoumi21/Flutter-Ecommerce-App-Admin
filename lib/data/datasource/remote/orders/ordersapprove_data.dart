import 'package:ecommerce_admin_app_php/core/class/crud.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';


class OrdersApproveData {
  Crud crud;
  OrdersApproveData(this.crud);

  ordersApproveData(String userid,String orderid) async {
    var respnse = await crud.postData(AppLink.ordersApprove,{
      "userid":userid,
      "orderid":orderid,
    });
    return respnse.fold((l) => l, (r) => r);
  }
}
