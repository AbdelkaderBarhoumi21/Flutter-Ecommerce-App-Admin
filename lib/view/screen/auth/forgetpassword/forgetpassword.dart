import 'package:ecommerce_admin_app_php/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/core/functions/validinput.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customTextTitleAuth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customtextformfieldauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      ForgetPasswordControllerImp(),
    );
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: AppBar(
          title: Text(
            "14".tr,
            style: Theme.of(
              context,
            ).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
          ),
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
          //or
          //init: ForgetPasswordControllerImp(), ==  Get.put(ForgetPasswordControllerImp());

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
                      CustomTextTitleAuth(TextTitle: "27".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(textbody: "29".tr),
                      const SizedBox(height: 45),
                      Customtextformauth(
                        isNumber: false,
                        myController: controller.emailController,
                        validator: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        hinText: "12".tr,
                        labelText: "18".tr,
                        iconData: Icons.email_outlined,
                        // myController: myController,
                      ),
                      CustomButtonAuth(
                        text: "30".tr,
                        onPressed: () {
                          controller.checkEmail();
                        },
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
