import 'package:ecommerce_admin_app_php/core/constant/routes.dart';
import 'package:ecommerce_admin_app_php/core/middleware/mymiddleware.dart';
import 'package:ecommerce_admin_app_php/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce_admin_app_php/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce_admin_app_php/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:ecommerce_admin_app_php/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce_admin_app_php/view/screen/auth/login.dart';
import 'package:ecommerce_admin_app_php/view/screen/auth/signup.dart';
import 'package:ecommerce_admin_app_php/view/screen/auth/sucessSignUp.dart';
import 'package:ecommerce_admin_app_php/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce_admin_app_php/view/screen/categories/addcategories_page.dart';
import 'package:ecommerce_admin_app_php/view/screen/categories/editcategories_page.dart';
import 'package:ecommerce_admin_app_php/view/screen/categories/viewcategories_page.dart';
import 'package:ecommerce_admin_app_php/view/screen/home_page.dart';
import 'package:ecommerce_admin_app_php/view/screen/items/additems_page.dart';
import 'package:ecommerce_admin_app_php/view/screen/items/edititems_page.dart';
import 'package:ecommerce_admin_app_php/view/screen/items/viewitems_page.dart';
import 'package:ecommerce_admin_app_php/view/screen/orders/orderscreen_page.dart';
import 'package:ecommerce_admin_app_php/view/screen/language_page.dart';
import 'package:ecommerce_admin_app_php/view/screen/onBoarding_page.dart';
import 'package:ecommerce_admin_app_php/view/screen/orders/archive_page.dart';
import 'package:ecommerce_admin_app_php/view/screen/orders/ordersdetails_page.dart';
import 'package:ecommerce_admin_app_php/view/screen/orders/pending_page.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  //middelware
  GetPage(
    name: "/",
    page: () => const Language(),
    middlewares: [Mymiddleware()],
  ),
  // GetPage(name: "/", page: () => const Test()),
  //onboarding
  GetPage(name: AppRoutes.onBoarding, page: () => const Onboarding()),
  //auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => const SucessResetPassword(),
  ),
  GetPage(name: AppRoutes.successSignUp, page: () => const Sucessignup()),
  GetPage(
    name: AppRoutes.verifyCodeSignup,
    page: () => const VerifyCodeSignUp(),
  ),
  GetPage(name: AppRoutes.home, page: () => const HomePage()),

  GetPage(name: AppRoutes.ordersScreen, page: () => const OrderScreenPage()),
  GetPage(name: AppRoutes.ordersPending, page: () => const OrdersPendingPage()),
  GetPage(name: AppRoutes.ordersDetails, page: () => const OrdersdetailsPage()),
  GetPage(name: AppRoutes.ordersArchive, page: () => const OrdersArchivePage()),

  GetPage(
      name: AppRoutes.categoriesView, page: () => const CategoriesViewPage()),
  GetPage(name: AppRoutes.categoriesAdd, page: () => const CategoriesAddPage()),
  GetPage(
      name: AppRoutes.categoriesEdit, page: () => const CategoriesEditPage()),
  GetPage(name: AppRoutes.itemsAdd, page: () => const ItemsAddPage()),
  GetPage(name: AppRoutes.itemsEdit, page: () => const ItemsEditPage()),
  GetPage(name: AppRoutes.itemsView, page: () => const ItemsViewPage()),
];
