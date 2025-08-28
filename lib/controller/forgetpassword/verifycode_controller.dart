import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/forgetpassword/verifycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifycodeForgetPassowrd);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
  Statusrequest statusrequest = Statusrequest.none;

  @override
  void onInit() {
    email = Get.arguments["email"];

    super.onInit();
  }

  @override
  checkCode() {}

  @override
  goToResetPassword(verifycodeForgetPassowrd) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await verifyCodeForgetPasswordData.postData(
      email!,
      verifycodeForgetPassowrd,
    );
    print("---------------------response: $response");
    statusrequest = handlingData(response);
    if (Statusrequest.sucess == statusrequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        print("valid");
        Get.offNamed(AppRoutes.resetPassword, arguments: {
          "email": email,
        });
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "verify code is not correct!",
        );
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }
}
