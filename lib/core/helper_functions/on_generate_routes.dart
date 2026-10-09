import 'package:e_commrece_app/features/auth/presentation/screen/sign_in_view.dart';
import 'package:e_commrece_app/features/auth/presentation/screen/signup_view.dart';
import 'package:e_commrece_app/features/best_selling/presentation/best_selling_view.dart';
import 'package:e_commrece_app/features/checkout/presentation/checkout_view.dart';
import 'package:e_commrece_app/features/home/presentation/screen/main_view.dart';
import 'package:e_commrece_app/features/main_navigation_screen/presentation/main_navigation_view.dart';
import 'package:e_commrece_app/features/onboarding/presentation/onboarding_view.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_item_entities.dart';
import 'package:e_commrece_app/features/splash/presentation/splash_view.dart';
import 'package:flutter/material.dart';

Route<double> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignInView.routeLogin:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignupView.routesSignUp:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case MainNavigationView.routeBottomNavigation:
      return MaterialPageRoute(
        builder: (context) => const MainNavigationView(),
      );
    case MainView.routeHome:
      return MaterialPageRoute(builder: (context) => const MainView());
    case BestSellingView.bestSellingRoute:
      return MaterialPageRoute(builder: (context) => const BestSellingView());
    case CheckoutView.checkOutRouts:
      final cartEntity = settings.arguments as CartItemEntities;
      return MaterialPageRoute(
        builder: (context) => CheckoutView(cartItemEntities: cartEntity),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
