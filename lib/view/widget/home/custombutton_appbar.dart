import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustombuttonAppbar extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  final IconData iconButton;
  final bool active;
  const CustombuttonAppbar({
    super.key,
    required this.onPressed,
    required this.textButton,
    required this.iconButton,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconButton,
            color: active == true ? AppColor.primaryColor : AppColor.grey2,
          ),
          Text(
            textButton,
            style: TextStyle(
              color: active == true ? AppColor.primaryColor : AppColor.grey2,
            ),
          ),
        ],
      ),
    );
  }
}
