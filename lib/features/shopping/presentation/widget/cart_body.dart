import 'package:e_commrece_app/core/widget/custom_divider.dart';
import 'package:e_commrece_app/core/widget/show_app_bar.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:e_commrece_app/features/shopping/presentation/widget/cart_header.dart';
import 'package:e_commrece_app/features/shopping/presentation/widget/cart_list.dart';
import 'package:e_commrece_app/features/shopping/presentation/widget/custom_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CartCubit>();
    final cartItems = controller.cartEntity.cartItem;
    final isEmpty = cartItems.isEmpty;
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

            if (!isEmpty) const SliverToBoxAdapter(child: CustomDivider()),
            CartList(cartList: cartItems),
            if (!isEmpty) const SliverToBoxAdapter(child: CustomDivider()),

            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
        Positioned(left: 16, right: 16, bottom: 20, child: CustomCartButton()),
      ],
    );
  }
}
