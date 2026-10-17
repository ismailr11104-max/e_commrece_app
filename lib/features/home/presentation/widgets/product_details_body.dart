import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/show_app_bar.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/button_product_details.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/image_product_details.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/price_product.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/product_description.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/quantity_button_product.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowAppBar(context, title: 'تفاصيل المنتج', showNotification: false),
          ImageProductDetails(image: product.imageUrl ?? ''),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
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
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ProductDescription(
              price: product.price,
              description: product.desc,
            ),
          ),
          SizedBox(height: 80),
          Container(
            width: double.infinity,
            height: 80,
            decoration: ShapeDecoration(
              color: Color(0xFFFFF3C5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonProductDetails(
                    onPressed: () {
                      context.read<CartCubit>().addProduct(
                        product,
                        count: cartEntities.quantity,
                      );
                    },
                  ),
                  SizedBox(width: 6),
                  Expanded(child: PriceProduct(cartEntities: cartEntities)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
