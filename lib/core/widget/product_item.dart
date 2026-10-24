import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/features/home/presentation/screen/product_details.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_entities.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  final ProductEntities product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartEntity = CartEntities(quantity: 1, productEntities: product);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetails.ProductDetailsRouts,
          arguments: {'product': product, 'cartEntities': cartEntity},
        );
      },
      child: Container(
        padding: AppSizes.p12,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppSizes.borderR20,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      product.imageUrl ?? '',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.broken_image,
                        size: AppSizes.iconLarge,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: AppSizes.p6,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: AppSizes.borderR10,
                      ),
                      child: Icon(
                        Icons.bookmark_border_rounded,
                        color: const Color(0xFF4CAF50),
                        size: AppSizes.font18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.h6),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.semiBold16,
            ),
            SizedBox(height: AppSizes.h6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    context.read<CartCubit>().addProduct(product);
                  },
                  borderRadius: AppSizes.borderR10,
                  child: Container(
                    padding: AppSizes.p6,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2ECC71),
                      borderRadius: AppSizes.borderR10,
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: AppSizes.font18),
                  ),
                ),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'KD${product.price} ',
                      style: TextStyles.semiBold16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
