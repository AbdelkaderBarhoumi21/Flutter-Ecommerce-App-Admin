import 'package:ecommerce_admin_app_php/core/class/crud.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
    var respnse = await crud.postData(AppLink.test, {});
    return respnse.fold((l) => l, (r) => r);
  }
}
