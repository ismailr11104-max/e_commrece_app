import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class PriceProduct extends StatelessWidget {
  const PriceProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 167,
            child: Text(
              'Total Price',
              textAlign: TextAlign.center,
              style: TextStyles.semiBold13.copyWith(
                color: const Color(0xFF999590),
              ),
            ),
          ),
          SizedBox(
            width: 167,
            child: Text(
              '\$5.68',
              textAlign: TextAlign.center,
              style: TextStyles.semiBold16.copyWith(
                fontSize: 22,
                color: const Color(0xFF333333),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
