import 'package:ecommerce_admin_app_php/controller/forgetpassword/resetpassword_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/core/functions/validinput.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customTextTitleAuth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customtextformfieldauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      resetPasswordControllerImp(),
    );
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: AppBar(
          title: Text(
            "42".tr,
            style: Theme.of(
              context,
            ).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
          ),
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
        ),
        body: GetBuilder<resetPasswordControllerImp>(
          builder: (controller) => HandlingdataviewRequest(
              statusrequest: controller.statusrequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      const SizedBox(height: 40),
                      CustomTextTitleAuth(TextTitle: "35".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(textbody: "34".tr),
                      const SizedBox(height: 45),
                      Customtextformauth(
                        isNumber: false,
                        obscureText: controller.isShowPassword,
                        onTapIcon: () {
                          controller.showPassowrd();
                        },
                        myController: controller.passwordController,
                        validator: (val) {
                          return validInput(val!, 5, 30, "password");
                        },
                        hinText: "13".tr,
                        iconData: Icons.lock_outline,
                        labelText: "19".tr,
                        // myController: myController,
                      ),
                      Customtextformauth(
                        isNumber: false,
                        obscureText: controller.isShowPassword,
                        onTapIcon: () {
                          controller.showPassowrd();
                        },
                        myController: controller.repasswordController,
                        validator: (val) {
                          return validInput(val!, 5, 30, "password");
                        },
                        hinText: "13".tr,
                        iconData: Icons.lock_outline,
                        labelText: "43".tr,
                        // myController: myController,
                      ),
                      CustomButtonAuth(
                        text: "33".tr,
                        onPressed: () {
                          controller.goToSucessResetPassword();
                        },
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
