import 'package:ecommerce_admin_app_php/core/class/crud.dart';
import 'package:ecommerce_admin_app_php/linkapi.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);

  postData(String email, String verifycode) async {
    var respnse = await crud.postData(AppLink.verifyCodeSignUp, {
      "email": email,
      "verifycode": verifycode,
    });
    return respnse.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var respnse = await crud.postData(AppLink.resend, {
      "email": email,
    });
    return respnse.fold((l) => l, (r) => r);
  }
}
