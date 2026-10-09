import 'package:e_commrece_app/core/widget/custom_text_from_field.dart';
import 'package:flutter/material.dart';

class AddressInputSection extends StatelessWidget {
  AddressInputSection({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController apartmentController = TextEditingController();
  TextEditingController phanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          CustomTextFromField(
            hintText: 'الاسم كامل',
            keyboardType: TextInputType.text,
            controller: nameController,
          ),
          SizedBox(height: 16),
          CustomTextFromField(
            hintText: 'البريد الإلكتروني',
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
          ),
          SizedBox(height: 16),
          CustomTextFromField(
            hintText: 'العنوان',
            keyboardType: TextInputType.text,
            controller: addressController,
          ),
          SizedBox(height: 16),
          CustomTextFromField(
            hintText: 'رقم الطابق , رقم الشقه ..',
            keyboardType: TextInputType.text,
            controller: apartmentController,
          ),
          SizedBox(height: 16),
          CustomTextFromField(
            hintText: 'رقم الهاتف',
            keyboardType: TextInputType.text,
            controller: phanController,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
