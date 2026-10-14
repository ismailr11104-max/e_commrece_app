import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.price,
    required this.description,
  });

  final num price;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '$price KD ', // استخدام $price المباشر
                  style: TextStyles.bold16.copyWith(
                    color: const Color(0xFF56A25F),
                    fontSize: 22,
                  ),
                ),
                TextSpan(
                  text: '/الكيلو',
                  style: TextStyles.bold16.copyWith(
                    color: const Color(0xFF999590),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: description,
                  style: TextStyles.regular16.copyWith(
                    color: const Color(0xFF333333),
                  ),
                ),
                TextSpan(
                  text: ' ...المزيد',
                  style: TextStyles.semiBold16.copyWith(
                    color: const Color(0xFFFFA552),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
