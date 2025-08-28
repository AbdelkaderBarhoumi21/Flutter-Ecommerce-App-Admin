import 'package:ecommerce_admin_app_php/core/class/crud.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';


class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData(String email, String password) async {
    var respnse = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    });
    return respnse.fold((l) => l, (r) => r);
  }
}
