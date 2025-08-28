import 'package:ecommerce_admin_app_php/controller/auth/signup_controller.dart';
import 'package:ecommerce_admin_app_php/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/core/functions/alertexitapp.dart';
import 'package:ecommerce_admin_app_php/core/functions/validinput.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customTextTitleAuth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customtextformfieldauth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    //SignUpcontrollerImp controller = Get.put(SignUpcontrollerImp());
    Get.put(SignUpcontrollerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text(
          "17".tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpcontrollerImp>(
          builder:
              (controller) => HandlingdataviewRequest(
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
                        const SizedBox(height: 40),
                        CustomTextTitleAuth(TextTitle: "10".tr),
                        const SizedBox(height: 10),
                        CustomTextBodyAuth(textbody: "24".tr),
                        const SizedBox(height: 45),
                        Customtextformauth(
                          isNumber: false,
                          myController: controller.usernameController,
                          validator: (val) {
                            return validInput(val!, 5, 100, "username");
                          },
                          hinText: "23".tr,
                          labelText: "20".tr,
                          iconData: Icons.person_outline,
                          // myController: myController,
                        ),
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
                          isNumber: true,
                          myController: controller.phoneController,
                          validator: (val) {
                            return validInput(val!, 5, 100, "phone");
                          },
                          hinText: "22".tr,
                          labelText: "21".tr,
                          iconData: Icons.phone_android_outlined,
                          // myController: myController,
                        ),
                        Customtextformauth(
                          isNumber: false,
                          obscureText: controller.isShowPassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          myController: controller.passwordController,
                          validator: (val) {
                            return validInput(val!, 5, 50, "password");
                          },
                          hinText: "13".tr,
                          iconData: Icons.lock_outline,
                          labelText: "19".tr,
                          // myController: myController,
                        ),
                        CustomButtonAuth(
                          text: "17".tr,
                          onPressed: () {
                            controller.signUp();
                          },
                        ),
                        const SizedBox(height: 30),
                        CustomTextSignupOrSignIn(
                          textone: "25".tr,
                          texttwo: "26".tr,
                          onTap: () {
                            controller.goToSignIn();
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
