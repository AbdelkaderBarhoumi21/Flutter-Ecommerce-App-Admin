import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/core/services/services.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/auth/logindata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class Logincontroller extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends Logincontroller {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isShowPassword = true;

  Statusrequest statusrequest = Statusrequest.none;
  LoginData loginData = LoginData(Get.find());

  MyServices myServices = Get.find();

  showPassowrd() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response = await loginData.postData(
        emailController.text,
        passwordController.text,
      );
      print("---------------------response: $response");
      statusrequest = handlingData(response);
      if (Statusrequest.sucess == statusrequest) {
        if (response['status'] == "success") {
          if (response['data']['admin_approve'] == 1) {
            myServices.sharedPreferences.setString(
              "id",
              response['data']['admin_id'].toString(),
            );
            String userId = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences.setString(
              "email",
              response['data']['admin_email'],
            );
            myServices.sharedPreferences.setString(
              "username",
              response['data']['admin_name'],
            );
            myServices.sharedPreferences.setString(
              "phone",
              response['data']['admin_phone'],
            );
            myServices.sharedPreferences.setString("step", "2");
            
            FirebaseMessaging.instance.subscribeToTopic("admin");
            FirebaseMessaging.instance.subscribeToTopic("admin${userId}");

            //data.addAll(response['data']);
            print("valid");
            Get.offNamed(AppRoutes.home);
          } else {
            Get.toNamed(
              AppRoutes.verifyCodeSignup,
              arguments: {"email": emailController.text},
            );
          }
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Please check your email or password",
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

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  goToSignUp() {
    // get off named will correct the duplicate global key error beacause in the to named the global key will stay duplicated
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
}
