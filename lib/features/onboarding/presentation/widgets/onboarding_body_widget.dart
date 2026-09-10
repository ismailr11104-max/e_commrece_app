import 'package:e_commrece_app/features/onboarding/presentation/widgets/page_view_widget.dart';
import 'package:flutter/material.dart';

class OnboardingBodyWidget extends StatelessWidget {
  const OnboardingBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [PageViewWidget()]);
  }
}
