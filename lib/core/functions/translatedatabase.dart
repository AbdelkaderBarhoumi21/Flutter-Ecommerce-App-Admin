import 'package:ecommerce_admin_app_php/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(columnAR, columnEN) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnAR;
  } else {
    return columnEN;
  }
}
