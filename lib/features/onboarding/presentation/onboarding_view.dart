import 'package:e_commrece_app/features/onboarding/presentation/widgets/onboarding_body_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const routeName = 'onboarding';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: OnboardingBodyWidget()));
  }
}
