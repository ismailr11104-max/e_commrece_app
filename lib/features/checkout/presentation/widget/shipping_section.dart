import 'package:e_commrece_app/features/checkout/domain/order_entities.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/shipping_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int isSelectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          ShippingItem(
            onTap: () {
              setState(() {
                isSelectedIndex = 0;
              });
            },
            isSelected: isSelectedIndex == 0,
            title: 'الدفع عند الاستلام',
            subTitle: 'التسليم من المكان',
            price:
                '${context.read<OrderEntities>().cartItemEntities.calculateTotal() + 40}',
          ),
          SizedBox(height: 12),
          ShippingItem(
            onTap: () {
              setState(() {
                isSelectedIndex = 1;
              });
            },
            isSelected: isSelectedIndex == 1,
            title: 'الدفع الاونلاين',
            subTitle: 'يرجي تحديد طريقه الدفع',
            price:
                '${context.read<OrderEntities>().cartItemEntities.calculateTotal()}',
          ),
        ],
      ),
    );
  }
}
