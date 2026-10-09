import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/custom_button.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/check_steps.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/page_view_step.dart';
import 'package:flutter/material.dart';

class CheckOutBody extends StatefulWidget {
  const CheckOutBody({super.key});

  @override
  State<CheckOutBody> createState() => _CheckOutBodyState();
}

class _CheckOutBodyState extends State<CheckOutBody> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckSteps(currentPage: currentPage, pageController: pageController),
          Expanded(child: PageViewStep(pageController: pageController)),
          CustomButton(
            onPressed: () {
              pageController.animateToPage(
                currentPage + 1,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            child: Text(
              getNextButtonPage(currentPage),
              style: TextStyles.bold16,
            ),
          ),
          SizedBox(height: 48),
        ],
      ),
    );
  }

  getNextButtonPage(int currentState) {
    switch (currentState) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع عبر PayPal';
    }
  }
}
