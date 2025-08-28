import 'package:ecommerce_admin_app_php/controller/auth/successsignup_controller.dart';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customTextTitleAuth.dart';
import 'package:ecommerce_admin_app_php/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Sucessignup extends StatelessWidget {
  const Sucessignup({super.key});

  @override
  Widget build(BuildContext context) {
    SucessSignUpcontrollerImp Controller = Get.put(SucessSignUpcontrollerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          "32".tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 15),
            CustomTextTitleAuth(TextTitle: "37".tr),
            const SizedBox(height: 15),
            CustomTextBodyAuth(textbody: "44".tr),

            Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: "31".tr,
                onPressed: () {
                  Controller.goToPageLogin();
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
