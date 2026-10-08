import 'package:e_commrece_app/core/widget/custom_divider.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_entities.dart';
import 'package:e_commrece_app/features/shopping/presentation/widget/cart_item.dart';
import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  const CartList({super.key, required this.cartList});

  final List<CartEntities> cartList;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartList.length,
      itemBuilder: (BuildContext context, int index) {
        return CartItem(cartEntities: cartList[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return CustomDivider();
      },
    );
  }
}
