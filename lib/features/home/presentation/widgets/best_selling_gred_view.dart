import 'package:e_commrece_app/core/widget/product_item.dart';
import 'package:flutter/cupertino.dart';

class BestSellingGredView extends StatelessWidget {
  const BestSellingGredView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 180,
      ),
      itemBuilder: (context, index) {
        return ProductItem();
      },
    );
  }
}
