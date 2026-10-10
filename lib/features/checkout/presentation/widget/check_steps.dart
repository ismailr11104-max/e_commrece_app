import 'package:e_commrece_app/core/helper_functions/build_error_bar.dart';
import 'package:e_commrece_app/features/checkout/domain/order_entities.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/step_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if (context.read<OrderEntities>().payWithCash != null) {
                pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInBack,
                );
              } else {
                ShowErrorBar(context, 'يرجي تحديد طريقة الدفع');
              }
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
