import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/payment_details.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentDetails(
      title: 'ملخص الطلب :',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المجموع الفرعي :',
                style: TextStyles.regular13.copyWith(color: Color(0xff4E5556)),
              ),
              Text(
                '150 جنيه',
                style: TextStyles.semiBold16.copyWith(color: Color(0xff0C0D0D)),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'التوصيل  :',
                style: TextStyles.regular13.copyWith(color: Color(0xff4E5556)),
              ),
              Text(
                '30 جنيه',
                style: TextStyles.semiBold13.copyWith(color: Color(0xff4E5556)),
              ),
            ],
          ),
          SizedBox(height: 8),
          SizedBox(
            width: 274,
            child: Divider(height: 1, color: Color(0xffCACECE)),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الكلي',
                style: TextStyles.bold16.copyWith(color: Color(0xff0C0D0D)),
              ),
              Text(
                '180 جنيه',
                style: TextStyles.bold16.copyWith(color: Color(0xff0C0D0D)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
