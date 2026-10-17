import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNutritionalBadge extends StatelessWidget {
  final String iconPath;
  final String value;
  final String subtitle;
  final bool isCalories;

  const CustomNutritionalBadge({
    Key? key,
    required this.iconPath,
    required this.value,
    required this.subtitle,
    this.isCalories = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 113,
      height: 160,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
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
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: TextStyles.bold16.copyWith(color: Color(0xFFFAA646)),
                ),
                if (isCalories)
                  TextSpan(
                    text: ' كالوري',
                    style: TextStyles.bold13.copyWith(color: Color(0xFFFAA646)),
                  ),
                const TextSpan(text: '\n'),
                TextSpan(
                  text: subtitle,
                  style: TextStyles.regular16.copyWith(
                    color: Color(0xff979899),
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
