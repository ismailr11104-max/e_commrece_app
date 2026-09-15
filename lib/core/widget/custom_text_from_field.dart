import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
  });

  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: builderBorder(),
        enabledBorder: builderBorder(),
        focusedBorder: builderBorder(),
        filled: true,
        fillColor: Color(0xffF9FAFA),
      ),
    );
  }

  OutlineInputBorder builderBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(width: 1, color: Color(0xffE6E9E9)),
    );
  }
}
