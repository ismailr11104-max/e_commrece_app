import 'package:e_commrece_app/core/widget/custom_app_bar.dart';
import 'package:e_commrece_app/features/auth/presentation/widget/login_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeLogin = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: 'تسجيل دخول'),
      body: LoginBody(),
    );
  }
}
