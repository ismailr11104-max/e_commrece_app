import 'package:e_commrece_app/core/services/service_locator/injection_container.dart';
import 'package:e_commrece_app/core/widget/build_app_bar.dart';
import 'package:e_commrece_app/features/best_selling/presentation/widget/best_selling_body.dart';
import 'package:e_commrece_app/features/home/presentation/controller/best_selling_cubit/best_selling_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const bestSellingRoute = 'best-selling';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BestSellingCubit(sl())..getBestSellingProduct(),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'الأكثر مبيعًا'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: BestSellingBody(),
        ),
      ),
    );
  }
}
