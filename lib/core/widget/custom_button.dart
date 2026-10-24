import 'package:e_commrece_app/core/utils/app_colors.dart';
import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.child});

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(AppSizes.radius16),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
