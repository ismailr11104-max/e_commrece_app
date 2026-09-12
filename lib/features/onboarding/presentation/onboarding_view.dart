import 'package:e_commrece_app/features/onboarding/presentation/controller/onboarding_cubit.dart';
import 'package:e_commrece_app/features/onboarding/presentation/widgets/onboarding_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const routeName = 'onboarding';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: const Scaffold(body: SafeArea(child: OnboardingBodyWidget())),
    );
  }
}
