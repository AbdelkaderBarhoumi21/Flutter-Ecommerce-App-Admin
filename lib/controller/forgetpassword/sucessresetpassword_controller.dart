import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
abstract class SucessResetPasswordcontroller extends GetxController {
  goToPageLogin();
}

class SucessResetPasswordcontrollerImp extends SucessResetPasswordcontroller {
  @override
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
