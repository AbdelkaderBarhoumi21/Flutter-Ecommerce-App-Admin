import 'package:ecommerce_admin_app_php/controller/auth/signup_controller.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // la sortie de la page, GetX peut automatiquement les supprimer (si tu utilises fenix: false par défaut)
    Get.lazyPut(() => SignUpcontrollerImp(), fenix: false);
  }
}
