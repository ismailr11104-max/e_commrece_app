import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_action/cart_action_cubit.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomOrderDetails extends StatelessWidget {
  const CustomOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartActionCubit, CartActionState>(
      builder: (context, state) {
        final subtotal = context.read<CartCubit>().cartEntity.calculateTotal();
        const deliveryFee = 30;
        final total = subtotal + deliveryFee;
        return Container(
          padding: EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'المجموع الفرعي :',
                    style: TextStyles.semiBold13.copyWith(
                      color: Color(0xff999590),
                    ),
                  ),
                  Text(
                    '${subtotal}',
                    style: TextStyles.semiBold13.copyWith(
                      color: Color(0xff999590),
                    ),
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
                    style: TextStyles.semiBold13.copyWith(
                      color: Color(0xff999590),
                    ),
                  ),
                  Text(
                    context.read<CartCubit>().cartEntity.cartItem.isEmpty
                        ? '0'
                        : '${deliveryFee}',
                    style: TextStyles.semiBold13.copyWith(
                      color: Color(0xff999590),
                    ),
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
                    context.read<CartCubit>().cartEntity.cartItem.isEmpty
                        ? '0'
                        : '${total}',
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
      },
    );
  }
}
