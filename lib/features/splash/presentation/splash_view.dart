import 'package:e_commrece_app/core/services/shared_preferences/shared_pref_manger.dart';
import 'package:e_commrece_app/features/auth/presentation/screen/sign_in_view.dart';
import 'package:e_commrece_app/features/home/presentation/home_view.dart';
import 'package:e_commrece_app/features/onboarding/presentation/onboarding_view.dart';
import 'package:e_commrece_app/features/splash/presentation/widgets/splash_widget_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const routeName = 'splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SplashWidgetBody()));
  }

  void executeNavigation() {
    Future.delayed(const Duration(seconds: 3), () async {
      if (!mounted) return;
      final bool onboardingCompleted =
          SharedPrefManger().getBool("onboarding_completed") ?? false;
      final bool isLogin = SharedPrefManger().getBool("is_login") ?? false;

      if (!onboardingCompleted) {
        Navigator.of(context).pushReplacementNamed(OnBoardingView.routeName);
      } else if (!isLogin) {
        Navigator.of(context).pushReplacementNamed(SignInView.routeLogin);
      } else {
        Navigator.of(context).pushReplacementNamed(HomeView.routeHome);
      }
    });
  }
}
