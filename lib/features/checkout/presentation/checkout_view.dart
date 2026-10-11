import 'package:e_commrece_app/core/helper_functions/get_user_data.dart';
import 'package:e_commrece_app/core/services/service_locator/injection_container.dart';
import 'package:e_commrece_app/core/widget/show_app_bar.dart';
import 'package:e_commrece_app/features/checkout/domain/address_entities.dart';
import 'package:e_commrece_app/features/checkout/domain/order_entities.dart';
import 'package:e_commrece_app/features/checkout/presentation/controller/add_order_cubit.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/check_out_body.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_item_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartItemEntities});

  final CartItemEntities cartItemEntities;
  static const checkOutRouts = 'checkout';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(sl()),
      child: Scaffold(
        appBar: ShowAppBar(context, title: 'الشحن', showNotification: false),

        body: Provider.value(
          value: OrderEntities(
            cartItemEntities,
            addressEntities: AddressEntities(),
            uId: getUser()!.uid,
          ),
          child: CheckOutBody(),
        ),
      ),
    );
  }
}
