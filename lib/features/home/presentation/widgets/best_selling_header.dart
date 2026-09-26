import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعًا',
          style: TextStyles.bold16.copyWith(color: Color(0xff0C0D0D)),
        ),
        Text(
          'المزيد',
          style: TextStyles.regular13.copyWith(color: Color(0xff949D9E)),
        ),
      ],
    );
  }
}
