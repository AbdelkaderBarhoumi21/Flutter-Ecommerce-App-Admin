import 'package:ecommerce_admin_app_php/controller/auth/verifycodesignup_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customTextTitleAuth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // VerifyCodeSignUpController conrtoller = Get.put(
    //   VerifyCodeSignUpControllerImp(),
    // );
    Get.put(VerifyCodeSignUpControllerImp());

    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text(
          "39".tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder:
            (controller) => HandlingdataviewRequest(
              statusrequest: controller.statusrequest,
              widget: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 35,
                ),
                child: ListView(
                  children: [
                    const SizedBox(height: 40),
                    CustomTextTitleAuth(TextTitle: "40".tr),
                    const SizedBox(height: 15),
                    CustomTextBodyAuth(textbody: "41 ${controller.email}".tr),
                    const SizedBox(height: 45),
                    OtpTextField(
                      // handleControllers: ,
                      numberOfFields: 5,
                      borderColor: Color(0xFF512DA8),
                      fieldWidth: 50,
                      borderRadius: BorderRadius.circular(10),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        controller.goToSuccessSignUp(verificationCode);
                      }, // end onSubmit
                    ),
                    const SizedBox(height: 40),
                    CustomButtonAuth(
                      text: "Resend verify code".tr,
                      onPressed: () {
                        controller.resend();
                      },
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
