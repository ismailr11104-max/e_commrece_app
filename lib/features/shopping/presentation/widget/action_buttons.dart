import 'package:e_commrece_app/core/utils/app_colors.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/quantity_action_button.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_entities.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_action/cart_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key, required this.cartEntities});

  final CartEntities cartEntities;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuantityActionButton(
          width: 24,
          height: 24,
          iconColor: Colors.white,
          icon: Icons.add,
          color: AppColors.primaryColor,
          onPressed: () {
            cartEntities.incrementQuantity();
            context.read<CartActionCubit>().cartItemUpdated(cartEntities);
          },
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '${cartEntities.quantity}',
            textAlign: TextAlign.center,
            style: TextStyles.bold16,
          ),
        ),

        QuantityActionButton(
          width: 24,
          height: 24,
          iconColor: Colors.grey,
          icon: Icons.remove,
          color: const Color(0xFFF3F5F7),
          onPressed: () {
            cartEntities.decrementQuantity();
            context.read<CartActionCubit>().cartItemUpdated(cartEntities);
          },
        ),
      ],
    );
  }
}
