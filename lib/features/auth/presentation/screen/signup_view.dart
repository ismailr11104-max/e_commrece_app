import 'package:e_commrece_app/core/widget/custom_app_bar.dart';
import 'package:e_commrece_app/features/auth/presentation/widget/signup_body.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const String routesSignUp = 'signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: 'حساب جديد'),
      body: SafeArea(child: SignupBody()),
    );
  }
}
