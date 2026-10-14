import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/show_app_bar.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/custom_cart_button.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/image_product_details.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/price_product.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/product_description.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/quantity_button_product.dart';
import 'package:flutter/material.dart';

import '../../../shopping/domain/cart_entities.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    super.key,
    required this.product,
    required this.cartEntities,
  });

  final ProductEntities product;
  final CartEntities cartEntities;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShowAppBar(
              context,
              title: 'تفاصيل المنتج',
              showNotification: false,
            ),
            ImageProductDetails(image: product.imageUrl ?? ''),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product.name,
                    style: TextStyles.bold16.copyWith(fontSize: 22),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                QuantityButtonProduct(cartEntities: cartEntities),
              ],
            ),
            const SizedBox(height: 20),
            ProductDescription(price: product.price, description: product.desc),
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceProduct(),
                SizedBox(width: 6),
                Expanded(child: CustomCartButton()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
