import 'package:e_commrece_app/core/widget/search_text_field.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/Featured_list.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/best_selling_header.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/costom_home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                SizedBox(height: 16),
                CustomHomeAppBar(),
                SizedBox(height: 16),
                SearchTextField(),
                SizedBox(height: 12),
                FeaturedList(),
                SizedBox(height: 12),
                BestSellingHeader(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
