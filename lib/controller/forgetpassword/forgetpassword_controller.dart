import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  // goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  Statusrequest statusrequest = Statusrequest.none;

  late TextEditingController emailController;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  checkEmail() async {
    if (formState.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response = await checkEmailData.postData(
        emailController.text,
      );
      print("---------------------response: $response");
      statusrequest = handlingData(response);
      if (Statusrequest.sucess == statusrequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          print("valid");
          Get.offNamed(AppRoutes.verifyCode,
              arguments: {"email": emailController.text});
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Email not found!",
          );
          statusrequest = Statusrequest.failure;
        }
      }
      update();
      print("valid");
    }
  }

  // @override
  // goToVerifyCode() {
  //   var formData = formState.currentState;
  //   if (formData!.validate()) {
  //     print("valid");
  //     Get.offNamed(AppRoutes.verifyCode);
  //   } else {
  //     print("not valid");
  //   }
  // }
}
