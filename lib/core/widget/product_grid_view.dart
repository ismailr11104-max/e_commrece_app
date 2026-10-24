import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:e_commrece_app/core/widget/product_item.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.products});
  final List<ProductEntities> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.s12,
        mainAxisSpacing: AppSizes.h8,
        childAspectRatio: 163 / 240,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductItem(product: product);
      },
    );
  }
}
