import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState());

  PageController pageController = PageController();
  void onPageChange(int index) {
    if (index == 1) {
      emit(state.copyWith(currentIndex: index, isLastPage: true));
    } else {
      emit(state.copyWith(currentIndex: index, isLastPage: false));
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
