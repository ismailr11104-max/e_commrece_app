import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/core/utils/app_image.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/custom_nutritional_badge.dart';
import 'package:flutter/material.dart';

class NutritionalBadgeCar extends StatelessWidget {
  const NutritionalBadgeCar({super.key, required this.productEntities});
  final ProductEntities productEntities;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
      children: [
        CustomNutritionalBadge(
          iconPath: Assets.calories,
          value: '${productEntities.numberOfCalories}',
          subtitle: '100 جرام',
        ),
        CustomNutritionalBadge(
          iconPath: Assets.expiryDate,
          value: '${productEntities.expirationsMonths}',
          subtitle: 'مدة الصلاحيه',
          isCalories: false,
        ),
        CustomNutritionalBadge(
          iconPath: Assets.lotus,
          value: '100%',
          subtitle: 'طبيعي',
          isCalories: false,
        ),
      ],
    );
  }
}
