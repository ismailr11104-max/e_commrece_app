import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_entities.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_action/cart_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceProduct extends StatelessWidget {
  const PriceProduct({super.key, required this.cartEntities});

  final CartEntities cartEntities;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartActionCubit, CartActionState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Total Price',
              textAlign: TextAlign.center,
              style: TextStyles.semiBold13.copyWith(
                color: const Color(0xFF999590),
              ),
            ),
            Text(
              '${cartEntities.calculateTotalPrice()}',
              textAlign: TextAlign.center,
              style: TextStyles.semiBold16.copyWith(
                fontSize: 22,
                color: const Color(0xFF333333),
              ),
            ),
          ],
        );
      },
    );
  }
}
