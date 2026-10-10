import 'package:e_commrece_app/features/checkout/presentation/widget/address_input_section.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/payment_section.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/shipping_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PageViewStep extends StatelessWidget {
  const PageViewStep({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: PageView.builder(
        itemCount: getPages().length,
        controller: pageController,
        itemBuilder: (BuildContext context, int index) {
          return getPages()[index];
        },
      ),
    );
  }

  List<Widget> getPages() {
    return [
      ShippingSection(),
      AddressInputSection(formKey: formKey, valueListenable: valueListenable),
      PaymentSection(),
    ];
  }
}
