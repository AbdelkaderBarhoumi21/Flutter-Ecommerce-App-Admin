import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/core/localization/changelocale.dart';
import 'package:ecommerce_admin_app_php/view/widget/language/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: Container(
        padding: const EdgeInsetsDirectional.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 20),
            customButtonLanguage(
              textbutton: "Ar",
              onPressed: () {
                controller.changLang("ar");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
            const SizedBox(height: 10),
            customButtonLanguage(
              textbutton: "En",
              onPressed: () {
                controller.changLang("en");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
