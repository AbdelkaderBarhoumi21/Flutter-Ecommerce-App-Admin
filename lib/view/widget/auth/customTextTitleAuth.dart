import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String TextTitle;
  const CustomTextTitleAuth({super.key, required this.TextTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      TextTitle,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
