import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/auth/signupdata.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignUpcontroller extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpcontrollerImp extends SignUpcontroller {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isShowPassword = true;

  SignUpData signUpData = SignUpData(Get.find());
  List data = [];
  // late Statusrequest statusrequest;
  Statusrequest statusrequest = Statusrequest.none;
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  signUp() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response = await signUpData.postData(
        usernameController.text,
        passwordController.text,
        emailController.text,
        phoneController.text,
      );
      print("---------------------response: $response");
      statusrequest = handlingData(response);
      if (Statusrequest.sucess == statusrequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          print("valid");
          Get.offNamed(
            AppRoutes.verifyCodeSignup,
            arguments: {"email": emailController.text},
          );
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "this email or phone is already exits",
          );
          statusrequest = Statusrequest.failure;
        }
      }
      update();

      // this delete is to delete the controller from the memory after the user sign up ou remplacer dans le signup put par lazy put
      // Get.delete<SignUpcontrollerImp>();
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }
}
