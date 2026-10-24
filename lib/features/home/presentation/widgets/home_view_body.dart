import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:e_commrece_app/core/widget/custom_see_all.dart';
import 'package:e_commrece_app/core/widget/search_text_field.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/Featured_list.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/categpry_list_cubit.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/costom_home_app_bar.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/product_grid_view_cubit.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.s8),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: AppSizes.h16),
                const CustomHomeAppBar(),
                SizedBox(height: AppSizes.h16),
                const SearchTextField(),
                SizedBox(height: AppSizes.h12),
                const FeaturedList(),
                SizedBox(height: AppSizes.h16),
                const CustomSeeAll(title: 'Categories'),
                SizedBox(height: AppSizes.h12),
                const CategpryListCubit(),
              ],
            ),
          ),
          const ProductGridViewCubit(),
        ],
      ),
    );
  }
}
