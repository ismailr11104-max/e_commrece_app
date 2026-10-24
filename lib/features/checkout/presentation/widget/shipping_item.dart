import 'package:e_commrece_app/core/utils/app_colors.dart';
import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });

  final String title, subTitle, price;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.only(
          top: AppSizes.h16,
          right: AppSizes.s28,
          left: 13,
          bottom: AppSizes.h16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
            ),
            borderRadius: AppSizes.borderR4,
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected
                  ? const ActiveShippingItemDot()
                  : const InActiveShippingItemDot(),
              SizedBox(width: AppSizes.s10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.semiBold13.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: AppSizes.h6),
                  Text(
                    subTitle,
                    style: TextStyles.regular13.copyWith(color: Colors.black),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  ' $priceجنيه ',
                  style: TextStyles.bold16.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InActiveShippingItemDot extends StatelessWidget {
  const InActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        shape: OvalBorder(side: BorderSide(width: 1, color: Color(0xFF949D9E))),
      ),
    );
  }
}

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        color: Color(0xFF1B5E37),
        shape: OvalBorder(side: BorderSide(width: 4, color: Colors.white)),
      ),
    );
  }
}
