import 'package:ecommerce_admin_app_php/core/class/crud.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';


class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  postData(String username, String password, String email, String phone) async {
    var respnse = await crud.postData(AppLink.signUp, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return respnse.fold((l) => l, (r) => r);
  }
}
