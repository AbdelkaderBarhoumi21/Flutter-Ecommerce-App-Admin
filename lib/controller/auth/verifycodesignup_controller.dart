import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/auth/verifycodesignupdata.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verifycodeSignUp);
  resend();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  //late String verifyCode;
  String? email;

  Statusrequest statusrequest = Statusrequest.none;
  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verifycodeSignUp) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(
      email!,
      verifycodeSignUp,
    );
    print("---------------------response: $response");
    statusrequest = handlingData(response);
    if (Statusrequest.sucess == statusrequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        print("valid");
        Get.offNamed(AppRoutes.successSignUp);
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

  @override
  resend() {
    verifyCodeSignUpData.resendData(email!);
  }
}
