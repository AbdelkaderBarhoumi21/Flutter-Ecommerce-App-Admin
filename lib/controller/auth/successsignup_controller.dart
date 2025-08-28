
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SucessSignUpcontroller extends GetxController {
  goToPageLogin();
}

class SucessSignUpcontrollerImp extends SucessSignUpcontroller {
  @override
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
