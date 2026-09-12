import 'package:e_commrece_app/features/auth/presentation/login_view.dart';
import 'package:e_commrece_app/features/home/presentation/home_view.dart';
import 'package:e_commrece_app/features/onboarding/presentation/onboarding_view.dart';
import 'package:e_commrece_app/features/splash/presentation/splash_view.dart';
import 'package:flutter/material.dart';

Route<double> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginView.routeLogin:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case HomeView.routeHome:
      return MaterialPageRoute(builder: (context) => const HomeView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
