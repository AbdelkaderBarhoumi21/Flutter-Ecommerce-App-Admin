import 'package:ecommerce_admin_app_php/core/class/crud.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';


class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);

  postData(String email, String verifycode) async {
    var respnse = await crud.postData(AppLink.verifycodeforgetpassword, {
      "email": email,
      "verifycode": verifycode,
    });
    return respnse.fold((l) => l, (r) => r);
  }
}
