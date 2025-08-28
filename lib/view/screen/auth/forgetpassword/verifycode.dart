import 'package:ecommerce_admin_app_php/controller/forgetpassword/verifycode_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customTextTitleAuth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
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
      body: GetBuilder<VerifyCodeControllerImp>(
          builder: (controller) => HandlingdataviewRequest(
                statusrequest: controller.statusrequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                  child: ListView(
                    children: [
                      const SizedBox(height: 40),
                      CustomTextTitleAuth(TextTitle: "40".tr),
                      const SizedBox(height: 15),
                      CustomTextBodyAuth(textbody: "41".tr),
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
                          controller.goToResetPassword(verificationCode);
                        }, // end onSubmit
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
