import 'package:e_commrece_app/features/checkout/presentation/widget/step_item.dart';
import 'package:flutter/cupertino.dart';

class CheckSteps extends StatelessWidget {
  const CheckSteps({
    super.key,
    required this.currentPage,
    required this.pageController,
  });

  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInBack,
              );
            },
            child: StepItem(
              title: getSteps()[index],
              index: (index + 1).toString(),
              isActive: index <= currentPage,
            ),
          ),
        );
      }),
    );
  }
}

List<String> getSteps() {
  return ['الدفع', 'لعنوان', 'الشحن'];
}
