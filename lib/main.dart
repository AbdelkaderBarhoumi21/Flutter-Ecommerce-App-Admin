import 'package:ecommerce_admin_app_php/bindings/initialbinding.dart';
import 'package:ecommerce_admin_app_php/core/localization/changelocale.dart';
import 'package:ecommerce_admin_app_php/core/localization/translation.dart';
import 'package:ecommerce_admin_app_php/core/services/services.dart';
import 'package:ecommerce_admin_app_php/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter E-commerce App",

      translations: MyTranslatin(),
      locale: controller.language,
      theme: controller.apptheme,
      initialBinding: Initialbindings(),
      getPages: routes,
    );
  }
}
