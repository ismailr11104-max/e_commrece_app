import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: const Color(0xfff1f1f5), height: AppSizes.h24);
  }
}
