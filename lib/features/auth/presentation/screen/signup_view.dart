import 'package:e_commrece_app/core/services/service_locator/injection_container.dart';
import 'package:e_commrece_app/core/widget/custom_app_bar.dart';
import 'package:e_commrece_app/features/auth/domain/repo/create_user_repository.dart';
import 'package:e_commrece_app/features/auth/presentation/controller/sign_up_cupit/sign_up_auth_cubit.dart';
import 'package:e_commrece_app/features/auth/presentation/widget/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const String routesSignUp = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmailAuthCubit(authRepo: sl<CreateUserRepository>()),
      child: Scaffold(
        appBar: CustomAppBar(context, title: 'حساب جديد'),
        body: SafeArea(child: SignupBody()),
      ),
    );
  }
}
