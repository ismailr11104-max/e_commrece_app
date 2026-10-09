import 'package:e_commrece_app/features/checkout/presentation/widget/order_details.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/shipping_address_widge.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SizedBox(height: 24), OrderDetails(), ShippingAddressWidget()],
    );
  }
}
