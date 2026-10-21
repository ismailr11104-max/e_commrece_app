import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/features/checkout/domain/entities/order_entities.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/payment_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                style: TextStyles.semiBold13.copyWith(color: Color(0xff999590)),
              ),
              Text(
                '${context.read<OrderEntities>().cartItemEntities.calculateTotal()}',
                style: TextStyles.semiBold13.copyWith(color: Color(0xff999590)),
              ),
            ],
          ),
          SizedBox(height: 12),
          Divider(height: 1, color: Color(0xffCACECE)),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'التوصيل  :',
                style: TextStyles.semiBold13.copyWith(color: Color(0xff999590)),
              ),
              Text(
                '30 جنيه',
                style: TextStyles.semiBold13.copyWith(color: Color(0xff999590)),
              ),
            ],
          ),
          SizedBox(height: 12),
          Divider(height: 1, color: Color(0xffCACECE)),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الكلي',
                style: TextStyles.semiBold16.copyWith(
                  color: Color(0xff333333),
                  fontSize: 16,
                ),
              ),
              Text(
                '${context.read<OrderEntities>().cartItemEntities.calculateTotal() + 30}',
                style: TextStyles.semiBold16.copyWith(
                  color: Color(0xff333333),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
