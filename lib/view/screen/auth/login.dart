import 'package:ecommerce_admin_app_php/controller/auth/login_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/core/functions/alertexitapp.dart';
import 'package:ecommerce_admin_app_php/core/functions/validinput.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customTextTitleAuth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customtextformfieldauth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/logoauth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text(
          "9".tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
      ),
      // myst be inisde form for the validator to work
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingdataviewRequest(
            statusrequest: controller.statusrequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 35,
              ),
              child: Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    LogoAuth(),
                    CustomTextTitleAuth(TextTitle: "10".tr),
                    const SizedBox(height: 10),
                    CustomTextBodyAuth(textbody: "11".tr),
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
                    Customtextformauth(
                      isNumber: false,
                      obscureText: controller.isShowPassword,
                      onTapIcon: () {
                        controller.showPassowrd();
                      },
                      myController: controller.passwordController,
                      validator: (val) {
                        return validInput(val!, 3, 30, "password");
                      },
                      hinText: "13".tr,
                      iconData: Icons.lock_outline,
                      labelText: "19".tr,
                    ),
                    InkWell(
                      onTap: () {
                        controller.goToForgetPassword();
                      },
                      child: Text("14".tr, textAlign: TextAlign.end),
                    ),
                    CustomButtonAuth(
                      text: "15".tr,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
