import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/show_app_bar.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/image_product_details.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/price_product.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/product_description.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/quantity_button_product.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shopping/domain/cart_entities.dart';
import 'nutritional_badge_car.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowAppBar(context, title: 'تفاصيل المنتج', showNotification: false),
          ImageProductDetails(image: product.imageUrl ?? ''),
          SizedBox(height: AppSizes.h16),
          Padding(
            padding: AppSizes.horizontalP16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product.name,
                    style: TextStyles.bold16.copyWith(fontSize: AppSizes.font22),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                QuantityButtonProduct(cartEntities: cartEntities),
              ],
            ),
          ),
          SizedBox(height: AppSizes.h16),
          Padding(
            padding: AppSizes.horizontalP16,
            child: ProductDescription(
              price: product.price,
              description: product.desc,
            ),
          ),
          SizedBox(height: AppSizes.h16),
          NutritionalBadgeCar(productEntities: product),
          SizedBox(height: 55.h),
          Padding(
            padding: AppSizes.horizontalP16,
            child: PriceProduct(
              cartEntities: cartEntities,
              onPressed: () {
                context.read<CartCubit>().addProduct(
                  product,
                  count: cartEntities.quantity,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
