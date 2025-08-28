import 'package:ecommerce_admin_app_php/core/class/crud.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);

  getPendingOrdersData() async {
    var respnse = await crud.postData(AppLink.ordersPending, {});
    return respnse.fold((l) => l, (r) => r);
  }
  getapproveOrdersData() async {
    var respnse = await crud.postData(AppLink.ordersApprove, {});
    return respnse.fold((l) => l, (r) => r);
  }
}
