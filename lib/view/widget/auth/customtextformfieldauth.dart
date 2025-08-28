import 'package:flutter/material.dart';

class Customtextformauth extends StatelessWidget {
  final String hinText;
  final String labelText;
  final IconData iconData;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;
  final TextEditingController? myController;
  final String? Function(String?)? validator;
  const Customtextformauth({
    super.key,
    required this.hinText,
    required this.labelText,
    required this.iconData,
    required this.myController,
    required this.validator,
    required this.isNumber,
    this.obscureText,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: TextFormField(
        keyboardType: isNumber
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        controller: myController,
        validator: validator,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(labelText),
          ),
          hintText: hinText,
          hintStyle: TextStyle(fontSize: 14),
          suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
