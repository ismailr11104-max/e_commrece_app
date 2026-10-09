import 'package:e_commrece_app/core/helper_functions/build_error_bar.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/custom_button.dart';
import 'package:e_commrece_app/features/checkout/presentation/checkout_view.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/cart_action/cart_action_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartActionCubit, CartActionState>(
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            if (context.read<CartCubit>().cartEntity.cartItem.isNotEmpty) {
              Navigator.of(context).pushNamed(
                CheckoutView.checkOutRouts,
                arguments: context.read<CartCubit>().cartEntity.cartItem,
              );
            } else {
              buildErrorBar(context, 'لا توجد منتجات');
            }
          },
          child: Text(
            'الدفع ${context.read<CartCubit>().cartEntity.calculateTotal()} جنيه',
            style: TextStyles.bold16.copyWith(color: Colors.white),
          ),
        );
      },
    );
  }
}
