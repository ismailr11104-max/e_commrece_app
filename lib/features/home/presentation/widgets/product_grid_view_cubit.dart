import 'package:e_commrece_app/core/cubit/product_cubit.dart';
import 'package:e_commrece_app/core/cubit/product_state.dart';
import 'package:e_commrece_app/core/enum/products_state.dart';
import 'package:e_commrece_app/core/helper_functions/get_dummy_product.dart';
import 'package:e_commrece_app/core/widget/product_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductGridViewCubit extends StatelessWidget {
  const ProductGridViewCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state.productsStatus == ProductsStatus.failure &&
            state.products.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage ?? 'حدث خطأ')),
          );
        }
        if (state.productsStatus == ProductsStatus.loading) {
          return Skeletonizer.sliver(
            enabled: true,
            effect: const ShimmerEffect(
              baseColor: Color(0xFFE0E0E0),
              highlightColor: Color(0xFFF5F5F5),
            ),
            child: ProductGridView(products: getDummyProduct),
          );
        }
        return ProductGridView(products: state.products);
      },
    );
  }
}
