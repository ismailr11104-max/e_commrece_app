import 'package:e_commrece_app/core/widget/show_app_bar.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/check_out_body.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_item_entities.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartItemEntities});
  final CartItemEntities cartItemEntities;
  static const checkOutRouts = 'checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الشحن', showNotification: false),
      body: CheckOutBody(),
    );
  }
}
