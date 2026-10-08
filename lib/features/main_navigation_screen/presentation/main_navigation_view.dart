import 'package:e_commrece_app/core/helper_functions/build_error_bar.dart';
import 'package:e_commrece_app/features/%20profile/presentation/profile_view.dart';
import 'package:e_commrece_app/features/home/presentation/screen/main_view.dart';
import 'package:e_commrece_app/features/product_view/presentation/product_view.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:e_commrece_app/features/shopping/presentation/shopping_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'wedgit/custom_bottom_navigation.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  static const routeBottomNavigation = 'bottom_navigation';

  @override
  State<MainNavigationView> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationView> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    MainView(),
    ProductView(),
    ShoppingView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartItemAdd) {
            buildErrorBar(context, 'تمت إضافة المنتج إلى السلة بنجاح');
          }
          if (state is CartItemRemoved) {
            buildErrorBar(context, 'تمت حذف المنتج من السلة بنجاح');
          }
        },
        child: Scaffold(
          body: SafeArea(child: pages[currentIndex]),
          bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: currentIndex,
            onItemTapped: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
