import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/core/widget/product_item.dart';
import 'package:flutter/cupertino.dart';

class BestSellingListView extends StatelessWidget {
  const BestSellingListView({super.key, required this.product});

  final List<ProductEntities> product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 180,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProductItem(product: product[index]),
            ),
          );
        },
      ),
    );
  }
}
