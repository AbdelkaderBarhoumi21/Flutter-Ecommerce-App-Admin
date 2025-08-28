import 'package:ecommerce_admin_app_php/core/constant/imageasset.dart';
import 'package:flutter/widgets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.logo, height: 220);
  }
}
