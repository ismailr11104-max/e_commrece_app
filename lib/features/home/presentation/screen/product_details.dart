import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/core/services/service_locator/injection_container.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/product_details_body.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_entities.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_action/cart_action_cubit.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.product,
    required this.cartEntities,
  });

  static const ProductDetailsRouts = 'ProductDetails';
  final ProductEntities product;
  final CartEntities cartEntities;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartActionCubit()),
        BlocProvider.value(value: sl<CartCubit>()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: ProductDetailsBody(
            product: product,
            cartEntities: cartEntities,
          ),
        ),
      ),
    );
  }
}
