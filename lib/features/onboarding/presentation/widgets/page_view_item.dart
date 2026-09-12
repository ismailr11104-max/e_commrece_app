import 'package:e_commrece_app/core/utils/app_colors.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/features/auth/presentation/login_view.dart';
import 'package:e_commrece_app/features/onboarding/data/models/onboarding_item_model.dart';
import 'package:e_commrece_app/features/onboarding/presentation/controller/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({required this.itemModel, super.key});

  final OnboardingItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  itemModel.backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(
                  itemModel.image,
                  width: 260,
                  height: 240,
                ),
              ),
              BlocBuilder<OnboardingCubit, OnboardingState>(
                buildWhen: (previous, current) =>
                    previous.currentIndex != current.currentIndex,
                builder: (context, state) {
                  return Visibility(
                    visible: itemModel == OnboardingItemModel.items.first,
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(LoginView.routeLogin);
                        },
                        child: Text(
                          'تخطي',
                          textAlign: TextAlign.center,
                          style: TextStyles.regular13.copyWith(
                            color: Color(0xff949D9E),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        _buildTitle(itemModel.title),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            itemModel.subTitle,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(color: Color(0xff4E5556)),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(String title) {
    if (title.contains('HUB Fruit')) {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'مرحبًا بك في ',
              style: TextStyles.bold23.copyWith(color: Color(0xff0C0D0D)),
            ),
            TextSpan(
              text: ' HUB',
              style: TextStyles.bold23.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
            TextSpan(
              text: 'Fruit',
              style: TextStyles.bold23.copyWith(color: AppColors.primaryColor),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      );
    }
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.bold23.copyWith(color: Color(0xff0C0D0D)),
    );
  }
}
