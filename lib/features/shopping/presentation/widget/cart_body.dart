import 'package:e_commrece_app/core/helper_functions/build_error_bar.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/custom_button.dart';
import 'package:e_commrece_app/core/widget/custom_order_details.dart';
import 'package:e_commrece_app/core/widget/show_app_bar.dart';
import 'package:e_commrece_app/features/checkout/presentation/checkout_view.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:e_commrece_app/features/shopping/presentation/widget/cart_header.dart';
import 'package:e_commrece_app/features/shopping/presentation/widget/cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CartCubit>();
    final cartItems = controller.cartEntity.cartItem;
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ShowAppBar(context, title: 'السلة', isBack: false),
                  const SizedBox(height: 16),
                  const CartHeader(),
                  const SizedBox(height: 12),
                ],
              ),
            ),

            CartList(cartList: cartItems),
            const SliverToBoxAdapter(child: SizedBox(height: 80)),
          ],
        ),
        Positioned(
          left: 12,
          right: 12,
          bottom: 1,
          child: Column(
            children: [
              CustomOrderDetails(),
              SizedBox(height: 24),
              CustomButton(
                onPressed: () {
                  if (context
                      .read<CartCubit>()
                      .cartEntity
                      .cartItem
                      .isNotEmpty) {
                    Navigator.of(context).pushNamed(
                      CheckoutView.checkOutRouts,
                      arguments: context.read<CartCubit>().cartEntity,
                    );
                  } else {
                    ShowBar(context, 'لا توجد منتجات');
                  }
                },
                child: Text(
                  'الدفع ',
                  style: TextStyles.bold16.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
