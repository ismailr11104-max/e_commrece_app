import 'package:e_commrece_app/core/utils/app_image.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/payment_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentDetails(
      title: 'عنوان التوصيل',
      child: Row(
        children: [
          SvgPicture.asset(Assets.location),
          const SizedBox(width: 8),
          Text(
            'شارع النيل، مبنى رقم ١٢٣',
            textAlign: TextAlign.right,
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              child: Row(
                children: [
                  SvgPicture.asset(Assets.edit),
                  const SizedBox(width: 4),
                  Text(
                    'تعديل',
                    style: TextStyles.semiBold13.copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
