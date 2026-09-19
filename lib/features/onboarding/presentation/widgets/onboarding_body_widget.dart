import 'package:e_commrece_app/core/services/shared_preferences/shared_pref_manger.dart';
import 'package:e_commrece_app/core/utils/app_colors.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/custom_button.dart';
import 'package:e_commrece_app/features/auth/presentation/screen/sign_in_view.dart';
import 'package:e_commrece_app/features/onboarding/data/models/onboarding_item_model.dart';
import 'package:e_commrece_app/features/onboarding/presentation/controller/onboarding_cubit.dart';
import 'package:e_commrece_app/features/onboarding/presentation/widgets/page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingBodyWidget extends StatelessWidget {
  const OnboardingBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    return Column(
      children: [
        const Expanded(child: PageViewWidget()),
        const SizedBox(height: 64),
        BlocBuilder<OnboardingCubit, OnboardingState>(
          buildWhen: (previous, current) =>
              previous.currentIndex != current.currentIndex,
          builder: (context, state) {
            return SmoothPageIndicator(
              controller: cubit.pageController,
              count: OnboardingItemModel.items.length,
              axisDirection: Axis.horizontal,
              effect: WormEffect(
                spacing: 8,
                dotWidth: 10,
                dotHeight: 10,
                dotColor: state.isLastPage
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withValues(alpha: 0.2),
                activeDotColor: AppColors.primaryColor,
              ),
            );
          },
        ),
        const SizedBox(height: 28),
        BlocBuilder<OnboardingCubit, OnboardingState>(
          buildWhen: (previous, current) =>
              previous.isLastPage != current.isLastPage,
          builder: (context, state) {
            return Visibility(
              visible: state.isLastPage,
              maintainSize: true,
              maintainState: true,
              maintainAnimation: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomButton(
                  onPressed: () {
                    SharedPrefManger().setBool('onboarding_completed', true);
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(SignInView.routeLogin);
                  },
                  child: Text(
                    'ابدأ الان',
                    style: TextStyles.bold16.copyWith(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
