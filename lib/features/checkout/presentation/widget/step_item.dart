import 'package:e_commrece_app/features/checkout/presentation/widget/active_step_item.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/inactive_step_item.dart';
import 'package:flutter/cupertino.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.title,
    required this.index,
    required this.isActive,
  });

  final String title, index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: ActiveStepItem(title: title),
      secondChild: InactiveStepItem(title: title, index: index),
      crossFadeState: isActive
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 300),
    );
  }
}
