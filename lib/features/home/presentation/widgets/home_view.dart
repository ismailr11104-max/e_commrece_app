import 'package:e_commrece_app/core/cubit/product_cubit.dart';
import 'package:e_commrece_app/core/repo/product_repo.dart';
import 'package:e_commrece_app/core/services/service_locator/injection_container.dart';
import 'package:e_commrece_app/features/category/presentation/controller/category_cubit.dart';
import 'package:e_commrece_app/features/home/presentation/controller/best_selling_cubit/best_selling_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CategoryCubit(sl())..getCategories()),
        BlocProvider(create: (_) => ProductsCubit(sl())..getAllProducts()),
        BlocProvider(
          create: (context) =>
              BestSellingCubit(sl<ProductRepo>())..getBestSellingProduct(),
        ),
      ],
      child: const HomeViewBody(),
    );
  }
}
