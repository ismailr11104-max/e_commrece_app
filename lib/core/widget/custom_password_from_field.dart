import 'package:e_commrece_app/core/widget/custom_text_from_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordFromField extends StatefulWidget {
  const CustomPasswordFromField({
    super.key,
    required this.controller,
    this.validator,
    this.textInputAction,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;

  @override
  State<CustomPasswordFromField> createState() =>
      _CustomPasswordFromFieldState();
}

class _CustomPasswordFromFieldState extends State<CustomPasswordFromField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFromField(
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      controller: widget.controller,
      obscureText: _isObscured,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _isObscured = !_isObscured;
          });
        },
        icon: Icon(
          _isObscured
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
        ),
      ),
      textInputAction: TextInputAction.done,
    );
  }
}
