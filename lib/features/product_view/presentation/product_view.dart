import 'package:e_commrece_app/core/cubit/product_cubit.dart';
import 'package:e_commrece_app/core/services/service_locator/injection_container.dart';
import 'package:e_commrece_app/features/product_view/presentation/wedgie/product_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(sl())..getAllProducts(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ProductBody(),
        ),
      ),
    );
  }
}
