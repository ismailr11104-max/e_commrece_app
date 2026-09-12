import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeLogin = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Login View',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
