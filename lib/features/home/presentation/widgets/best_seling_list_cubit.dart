import 'package:e_commrece_app/core/helper_functions/get_dummy_product.dart';
import 'package:e_commrece_app/features/home/presentation/controller/best_selling_cubit/best_selling_cubit.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/best_selling_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingListCubit extends StatelessWidget {
  const BestSellingListCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellingCubit, BestSellingState>(
      builder: (context, state) {
        if (state is BestSellingSuccess) {
          return BestSellingListView(product: state.products);
        }

        if (state is BestSellingFailure) {
          return Text(state.message);
        }

        if (state is BestSellingLoading) {
          return Skeletonizer(
            enabled: true,
            effect: const ShimmerEffect(
              baseColor: Color(0xFFE0E0E0),
              highlightColor: Color(0xFFF5F5F5),
            ),
            child: BestSellingListView(product: getDummyProduct),
          );
        }

        return const SizedBox();
      },
    );
  }
}
