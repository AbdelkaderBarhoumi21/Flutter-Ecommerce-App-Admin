import 'package:ecommerce_admin_app_php/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class CardAdmin extends StatelessWidget {
  final String imageUrl;
  final String title;
  final void Function()? onTap;
  const CardAdmin({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 80,
            ),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }
}
