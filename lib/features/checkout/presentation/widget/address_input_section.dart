import 'package:e_commrece_app/core/widget/custom_text_from_field.dart';
import 'package:e_commrece_app/features/checkout/domain/order_entities.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressInputSection extends StatelessWidget {
  AddressInputSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<OrderEntities>().addressEntities!;
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, value, child) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 24),
                CustomTextFromField(
                  hintText: 'الاسم كامل',
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    controller.fullName = value;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFromField(
                  hintText: 'البريد الإلكتروني',
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    controller.email = value;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFromField(
                  hintText: 'العنوان',
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    controller.address = value;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFromField(
                  hintText: 'رقم الطابق , رقم الشقه ..',
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    controller.floorDetails = value;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFromField(
                  hintText: 'رقم الهاتف',
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    controller.phone = value;
                  },
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
