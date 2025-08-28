import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class resetPasswordController extends GetxController {
  resetPassword();
  goToSucessResetPassword();
}

class resetPasswordControllerImp extends resetPasswordController {
  late TextEditingController passwordController;
  late TextEditingController repasswordController;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Statusrequest statusrequest = Statusrequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  String? email;
  bool isShowPassword = true;

  showPassowrd() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    passwordController = TextEditingController();
    repasswordController = TextEditingController();
    email = Get.arguments["email"];

    super.onInit();
  }

  @override
  void dispose() {
    passwordController.dispose();
    repasswordController.dispose();
    super.dispose();
  }

  @override
  resetPassword() {}

  @override
  goToSucessResetPassword() async {
    if (passwordController.text != repasswordController.text) {
      return Get.defaultDialog(
          title: "Warning", middleText: "Password not match!");
    }
    if (formState.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response = await resetPasswordData.postData(
        email!,
        passwordController.text,
      );
      print("---------------------response: $response");
      statusrequest = handlingData(response);
      if (Statusrequest.sucess == statusrequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          print("valid");
          Get.offNamed(AppRoutes.successResetPassword);
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Try again Later!",
          );
          statusrequest = Statusrequest.failure;
        }
      }
      update();
      print("valid");
    } else {
      print("not valid");
    }
  }
}
