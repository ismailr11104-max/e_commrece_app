import 'package:e_commrece_app/features/onboarding/data/models/onboarding_item_model.dart';
import 'package:e_commrece_app/features/onboarding/presentation/controller/onboarding_cubit.dart';
import 'package:e_commrece_app/features/onboarding/presentation/widgets/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    return PageView.builder(
      controller: cubit.pageController,
      onPageChanged: cubit.onPageChange,
      itemCount: OnboardingItemModel.items.length,
      itemBuilder: (context, index) {
        return PageViewItem(itemModel: OnboardingItemModel.items[index]);
      },
    );
  }
}
