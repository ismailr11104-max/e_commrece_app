import 'package:e_commrece_app/core/helper_functions/build_error_bar.dart';
import 'package:e_commrece_app/core/utils/app_keys.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/custom_button.dart';
import 'package:e_commrece_app/features/checkout/domain/entities/order_entities.dart';
import 'package:e_commrece_app/features/checkout/domain/entities/pay_pal_payment/paypal_payment_entity.dart';
import 'package:e_commrece_app/features/checkout/presentation/controller/add_order_cubit.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/check_steps.dart';
import 'package:e_commrece_app/features/checkout/presentation/widget/page_view_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CheckOutBody extends StatefulWidget {
  const CheckOutBody({super.key});

  @override
  State<CheckOutBody> createState() => _CheckOutBodyState();
}

class _CheckOutBodyState extends State<CheckOutBody> {
  late final PageController pageController;
  final GlobalKey<FormState> _formKey = GlobalKey();
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );

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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckSteps(currentPage: currentPage, pageController: pageController),
          Expanded(
            child: PageViewStep(
              pageController: pageController,
              formKey: _formKey,
              valueListenable: valueNotifier,
            ),
          ),
          CustomButton(
            onPressed: () {
              if (currentPage == 0) {
                _handleShippingSectionValidation(context);
              } else if (currentPage == 1) {
                _handleAddressValidation();
              } else {
                final orderEntity = context.read<OrderEntities>();
                context.read<AddOrderCubit>().addOrder(
                  orderEntity: orderEntity,
                );
              }
            },
            child: Text(
              getNextButtonPage(currentPage),
              style: TextStyles.bold16.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(height: 48),
        ],
      ),
    );
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntities>().payWithCash != null) {
      pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      ShowBar(context, 'يرجي تحديد طريقه الدفع');
    }
  }

  void _handleAddressValidation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void processPayment() {
    final orderEntity = context.read<OrderEntities>();
    PaypalPaymentEntity paypalPaymentEntity = PaypalPaymentEntity.fromEntity(
      orderEntity,
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: kPaypalClientIDKey,
          secretKey: kPaypalSecretKey,
          transactions: [paypalPaymentEntity.toJson()],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            print("onSuccess: $params");
          },
          onError: (error) {
            print("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
          },
        ),
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
