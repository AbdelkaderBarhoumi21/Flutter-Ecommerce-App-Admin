import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String textbody;
  const CustomTextBodyAuth({super.key, required this.textbody});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 25),
      child: Text(
        textbody,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
