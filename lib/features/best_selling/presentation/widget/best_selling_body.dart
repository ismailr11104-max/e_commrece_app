import 'package:e_commrece_app/core/helper_functions/get_dummy_product.dart';
import 'package:e_commrece_app/core/utils/app_image.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/product_grid_view.dart';
import 'package:e_commrece_app/features/home/presentation/controller/best_selling_cubit/best_selling_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingBody extends StatelessWidget {
  const BestSellingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 24)),

        SliverToBoxAdapter(
          child: Text('الأكثر مبيعًا', style: TextStyles.bold16),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 8)),

        BlocBuilder<BestSellingCubit, BestSellingState>(
          builder: (context, state) {
            if (state is BestSellingLoading) {
              return Skeletonizer.sliver(
                enabled: true,
                effect: const ShimmerEffect(
                  baseColor: Color(0xFFE0E0E0),
                  highlightColor: Color(0xFFF5F5F5),
                ),
                child: ProductGridView(products: getDummyProduct),
              );
            }

            if (state is BestSellingFailure) {
              return SliverFillRemaining(
                child: Center(child: Text(state.message)),
              );
            }

            if (state is BestSellingSuccess) {
              if (state.products.isEmpty) {
                return SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Assets.search_found,
                          width: 220,
                          height: 184,
                        ),
                        Text(
                          'لا توجد منتجات',
                          style: TextStyles.bold16.copyWith(
                            color: const Color(0xff616A6B),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'عفوًا... هذه المعلومات غير متوفرة للحظة',
                          style: TextStyles.regular13.copyWith(
                            color: const Color(0xff616A6B),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return ProductGridView(products: state.products);
            }
            return const SliverToBoxAdapter(child: SizedBox());
          },
        ),
      ],
    );
  }
}
