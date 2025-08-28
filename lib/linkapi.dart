class AppLink {
  static const String server =
      "http://10.0.2.2/ecommerce"; //instead of using localhost use 10.0.2.2
  static const String imageStatic = "http://10.0.2.2/ecommerce/upload";

  // ================================= Image ========================== //
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";
  //============================test===============================//
  static const String test = "$server/test.php";
  // ================================= Auth ========================== //
  static const String signUp = "$server/admin/auth/signup.php";
  static const String login = "$server/admin/auth/login.php";
  static const String verifyCodeSignUp = "$server/admin/auth/verifycode.php";
  static const String resend = "$server/admin/auth/resend.php";
  // ============================= Forgetpassword ================ //

  static const String checkemail =
      "$server/admin/forgetpassword/checkemail.php";
  static const String resetpassword =
      "$server/admin/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/admin/forgetpassword/verifycode.php";
  // ============================= home ================ //
  static const String homepage = "$server/home.php";
// ============================= categories ================ //
  static const String categoriesAdd = "$server/admin/categories/add.php";
  static const String categoriesEdit = "$server/admin/categories/edit.php";
  static const String categoriesDelete = "$server/admin/categories/delete.php";
  static const String categoriesView = "$server/admin/categories/view.php";
// ============================= items ================ //
  static const String itemssAdd = "$server/admin/items/add.php";
  static const String itemsEdit = "$server/admin/items/edit.php";
  static const String itemsDelete = "$server/admin/items/delete.php";
  static const String itemsView = "$server/admin/items/view.php";

  // ============================= orders ================ //
  static const String ordersApprove = "$server/admin/orders/approve.php";
  static const String ordersPrepare = "$server/admin/orders/prepare.php";

  static const String ordersArchive = "$server/admin/orders/archive.php";
  static const String ordersPending = "$server/admin/orders/pending.php";
  static const String ordersAccepted = "$server/admin/orders/accepted.php";
  static const String ordersDetails = "$server/admin/orders/details.php";

  static const String ordersDone = "$server/admin/orders/done.php";
}
