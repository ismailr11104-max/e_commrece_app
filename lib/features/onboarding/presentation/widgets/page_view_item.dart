import 'package:e_commrece_app/core/services/shared_preferences/shared_pref_manger.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/custom_button.dart';
import 'package:e_commrece_app/features/main_navigation_screen/presentation/main_navigation_view.dart';
import 'package:e_commrece_app/features/onboarding/data/models/onboarding_item_model.dart';
import 'package:e_commrece_app/features/onboarding/presentation/controller/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({required this.itemModel, super.key});

  final OnboardingItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      buildWhen: (previous, current) =>
          previous.currentIndex != current.currentIndex ||
          previous.isLastPage != current.isLastPage,
      builder: (context, state) {
        final cubit = context.read<OnboardingCubit>();
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(itemModel.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.40),
                        Colors.black.withValues(alpha: 0.60),
                        Colors.black.withValues(alpha: 0.80),
                      ],
                      stops: const [0.0, 0.40, 0.60, 1.0],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Visibility(
                  visible: state.currentIndex == 2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(
                        MainNavigationView.routeBottomNavigation,
                      );
                    },
                    child: Text(
                      'تخطي',
                      style: TextStyles.semiBold16.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 50,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      itemModel.title,
                      textAlign: TextAlign.center,
                      style: TextStyles.bold16.copyWith(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      itemModel.subTitle,
                      textAlign: TextAlign.center,
                      style: TextStyles.regular16.copyWith(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SmoothPageIndicator(
                      controller: cubit.pageController,
                      count: OnboardingItemModel.items.length,
                      axisDirection: Axis.horizontal,
                      effect: WormEffect(
                        spacing: 5,
                        dotWidth: 6,
                        dotHeight: 6,
                        dotColor: Colors.white.withValues(alpha: 0.35),
                        activeDotColor: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        onPressed: () async {
                          if (!state.isLastPage) {
                            await cubit.pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            return;
                          }
                          await SharedPrefManger().setBool(
                            'onboarding_completed',
                            false,
                          );
                          if (!context.mounted) return;
                          Navigator.of(context).pushReplacementNamed(
                            MainNavigationView.routeBottomNavigation,
                          );
                        },
                        child: Text(
                          state.currentIndex == 2 ? 'ابدأ التسوق' : 'التالي',
                          style: TextStyles.bold16.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
