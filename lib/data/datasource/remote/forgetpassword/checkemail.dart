import 'package:ecommerce_admin_app_php/core/class/crud.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';


class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  postData(String email) async {
    var respnse = await crud.postData(AppLink.checkemail, {
      "email": email,
    });
    return respnse.fold((l) => l, (r) => r);
  }
}
