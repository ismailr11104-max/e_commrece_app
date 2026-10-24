import 'package:e_commrece_app/core/utils/app_colors.dart';
import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.h,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: AppSizes.borderR10,
          ),
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.s24),
          child: FittedBox(
            child: Text(
              'اطلب الان',
              style: TextStyles.bold13.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
