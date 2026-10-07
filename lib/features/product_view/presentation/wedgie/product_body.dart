import 'package:e_commrece_app/core/cubit/product_cubit.dart';
import 'package:e_commrece_app/core/cubit/product_state.dart';
import 'package:e_commrece_app/core/widget/build_app_bar.dart';
import 'package:e_commrece_app/core/widget/search_text_field.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/product_grid_view_cubit.dart';
import 'package:e_commrece_app/features/product_view/presentation/wedgie/filter_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  buildAppBar(context, title: 'المنتجات', isBack: false),
                  const SizedBox(height: 16),
                  const SearchTextField(),
                  const SizedBox(height: 12),
                  FilterProduct(ProductLength: state.products.length),
                ],
              ),
            ),
            const ProductGridViewCubit(),
          ],
        );
      },
    );
  }
}
