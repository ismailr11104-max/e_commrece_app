import 'package:e_commrece_app/core/services/service_locator/injection_container.dart';
import 'package:e_commrece_app/core/widget/custom_app_bar.dart';
import 'package:e_commrece_app/features/auth/domain/repo/sing_in_repository.dart';
import 'package:e_commrece_app/features/auth/presentation/controller/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commrece_app/features/auth/presentation/widget/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeLogin = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignInCubit(singInRepository: sl<SingInRepository>()),
      child: Scaffold(
        appBar: CustomAppBar(context, title: 'تسجيل دخول'),
        body: LoginBody(),
      ),
    );
  }
}
