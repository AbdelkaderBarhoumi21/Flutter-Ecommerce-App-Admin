import 'package:ecommerce_admin_app_php/view/screen/orders/accepted_page.dart';
import 'package:ecommerce_admin_app_php/view/screen/orders/archive_page.dart';
import 'package:ecommerce_admin_app_php/view/screen/orders/pending_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderscreenController extends GetxController {
  changePage(int i);
}

class OrderscreenControllerImp extends OrderscreenController {
  int currentPage = 0;
  List<Widget> listpage = [
    const OrdersPendingPage(),
    const OrdersAcceptedPage(),
    const OrdersArchivePage(),
  ];
  List bottomAppBar = [
    {"title": "Pending", "icon": Icons.pending},
    {"title": "Accepted", "icon": Icons.shopping_cart},
    {"title": "Archive", "icon": Icons.archive},
  ];
  // List bottomAppBar = ["Home", "Settings", "Profile", "Favorite"];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
