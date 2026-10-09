import 'package:e_commrece_app/features/checkout/presentation/widget/address_input_section.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/payment_section.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/shipping_section.dart';
import 'package:flutter/cupertino.dart';

class PageViewStep extends StatelessWidget {
  const PageViewStep({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: getPages().length,
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return getPages()[index];
      },
    );
  }
}

List<Widget> getPages() {
  return [ShippingSection(), AddressInputSection(), PaymentSection()];
}
