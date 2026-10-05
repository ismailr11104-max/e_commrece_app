import 'package:e_commrece_app/core/cubit/product_cubit.dart';
import 'package:e_commrece_app/core/helper_functions/get_dummy_category.dart';
import 'package:e_commrece_app/features/category/presentation/controller/category_cubit.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategpryListCubit extends StatelessWidget {
  const CategpryListCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return Skeletonizer(
            enabled: true,
            effect: const ShimmerEffect(
              baseColor: Color(0xFFE0E0E0),
              highlightColor: Color(0xFFF5F5F5),
            ),
            child: CategoryList(
              categories: dummyItems,
              onAllTap: () {},
              onCategoryTap: (String categoryId) {},
            ),
          );
        }

        if (state is CategoryFailure) {
          return Text(state.message);
        }

        if (state is CategorySuccess) {
          return CategoryList(
            categories: state.categories,
            onAllTap: () {
              context.read<ProductsCubit>().getAllProducts();
            },
            onCategoryTap: (categoryId) {
              context.read<ProductsCubit>().getProductsByCategory(categoryId);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
