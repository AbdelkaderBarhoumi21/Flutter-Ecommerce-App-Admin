import 'package:ecommerce_admin_app_php/core/class/crud.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';


class OrderArchiveData {
  Crud crud;
  OrderArchiveData(this.crud);

  getOrderArchiveData() async {
    var respnse = await crud.postData(AppLink.ordersArchive, {
    });
    return respnse.fold((l) => l, (r) => r);
  }


}
