// import 'package:ecommerce_admin_app_php/controller/home_controller.dart';
// import 'package:ecommerce_admin_app_php/controller/orders/orderscreen_controller.dart';
// import 'package:ecommerce_admin_app_php/core/constant/color.dart';
// import 'package:ecommerce_admin_app_php/core/functions/translatedatabase.dart';
// import 'package:ecommerce_admin_app_php/data/model/categories_model.dart';
// import 'package:ecommerce_admin_app_php/linkapi.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// class ListCategorieshome extends GetView<OrderscreenControllerImp> {
//   const ListCategorieshome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       child: ListView.separated(
//         separatorBuilder: (context, index) => SizedBox(width: 10),
//         scrollDirection: Axis.horizontal,
//         itemCount: controller.categories.length,
//         itemBuilder: (context, index) {
//           return Categories(
//             i: index,

//             categoriesModel: CategoriesModel.fromJson(
//               controller.categories[index],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class Categories extends GetView<HomeControllerImp> {
//   final CategoriesModel categoriesModel;
//   final int? i;
//   const Categories({super.key, required this.categoriesModel, required this.i});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         controller.goToItems(
//           controller.categories,
//           i!,
//           categoriesModel.categoriesId!.toString(),
//         );
//       },
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             decoration: BoxDecoration(
//               color: AppColor.thirdColor,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             height: 70,
//             width: 70,
//             child: SvgPicture.network(
//               "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
//               color: AppColor.secondColor,
//             ),
//           ),
//           Text(
//             "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
//             style: TextStyle(fontSize: 13, color: AppColor.black),
//           ),
//         ],
//       ),
//     );
//   }
// }
