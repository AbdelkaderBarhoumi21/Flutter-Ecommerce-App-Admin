import 'package:ecommerce_admin_app_php/core/class/crud.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';


class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData() async {
    var respnse = await crud.postData(AppLink.homepage, {});
    return respnse.fold((l) => l, (r) => r);
  }

  // searchData(String search) async {
  //   var respnse = await crud.postData(AppLink.itemsSearch, {"search": search});
  //   return respnse.fold((l) => l, (r) => r);
  // }
}
