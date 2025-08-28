
import 'package:ecommerce_admin_app_php/core/class/crud.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';


class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postData(String email, String password) async {
    var respnse = await crud.postData(AppLink.resetpassword, {
      "email": email,
      "password": password,
    });
    return respnse.fold((l) => l, (r) => r);
  }
}
