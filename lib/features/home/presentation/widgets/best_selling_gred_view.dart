import 'package:e_commrece_app/core/widget/product_item.dart';
import 'package:flutter/cupertino.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 8,
        mainAxisExtent: 180,
      ),
      itemBuilder: (context, index) {
        return ProductItem();
      },
    );
  }
}
