import 'package:e_commrece_app/core/widget/search_text_field.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/Featured_list.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/best_seling_list_cubit.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/best_selling_header.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/categpry_list_cubit.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/costom_home_app_bar.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/product_grid_view_cubit.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 16),
                const CustomHomeAppBar(),
                const SizedBox(height: 16),
                const SearchTextField(),
                const SizedBox(height: 12),
                const FeaturedList(),
                const SizedBox(height: 12),
                const BestSellingHeader(),
                const SizedBox(height: 12),
                const BestSellingListCubit(),
                const SizedBox(height: 16),
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
