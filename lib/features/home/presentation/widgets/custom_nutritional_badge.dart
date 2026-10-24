import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNutritionalBadge extends StatelessWidget {
  final String iconPath;
  final String value;
  final String subtitle;
  final bool isCalories;

  const CustomNutritionalBadge({
    super.key,
    required this.iconPath,
    required this.value,
    required this.subtitle,
    this.isCalories = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 113.w,
      height: 160.h,
      padding: EdgeInsets.symmetric(vertical: AppSizes.h20, horizontal: AppSizes.s12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppSizes.borderR24,
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.20),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath, fit: BoxFit.contain),
          SizedBox(height: AppSizes.h16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: TextStyles.bold16.copyWith(color: const Color(0xFFFAA646)),
                ),
                if (isCalories)
                  TextSpan(
                    text: ' كالوري',
                    style: TextStyles.bold13.copyWith(color: const Color(0xFFFAA646)),
                  ),
                const TextSpan(text: '\n'),
                TextSpan(
                  text: subtitle,
                  style: TextStyles.regular16.copyWith(
                    color: const Color(0xff979899),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
