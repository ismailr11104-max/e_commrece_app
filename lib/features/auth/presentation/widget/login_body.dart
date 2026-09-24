import 'package:e_commrece_app/core/enum/social_provider.dart';
import 'package:e_commrece_app/core/helper_functions/build_error_bar.dart';
import 'package:e_commrece_app/core/utils/app_colors.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/validators/email_validator.dart';
import 'package:e_commrece_app/core/validators/password_validator.dart';
import 'package:e_commrece_app/core/widget/custom_button.dart';
import 'package:e_commrece_app/core/widget/custom_password_from_field.dart';
import 'package:e_commrece_app/core/widget/custom_text_from_field.dart';
import 'package:e_commrece_app/features/auth/presentation/controller/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commrece_app/features/auth/presentation/controller/social_auth_cupit/social_auth_cubit.dart';
import 'package:e_commrece_app/features/auth/presentation/screen/signup_view.dart';
import 'package:e_commrece_app/features/auth/presentation/widget/or_divider.dart';
import 'package:e_commrece_app/features/auth/presentation/widget/social_login_button.dart';
import 'package:e_commrece_app/features/auth/presentation/widget/terms_or_auth_action_widget.dart';
import 'package:e_commrece_app/features/home/presentation/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFromField(
                validator: EmailValidator.validate,
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
              SizedBox(height: 16),
              CustomPasswordFromField(
                validator: PasswordValidator.validate,
                controller: passwordController,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {
                  if (state is SignInAuthSuccess) {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(HomeView.routeHome);
                  }
                  if (state is SignInAuthFailure) {
                    buildErrorBar(context, state.failure);
                  }
                },
                builder: (context, state) {
                  final isLoading = state is SignInAuthLoading;
                  return CustomButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (formKey.currentState?.validate() ?? false) {
                              context.read<SignInCubit>().signInWithEmail(
                                email: emailController.text.trim(),
                                password: passwordController.text,
                              );
                            }
                          },
                    child: isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'تسجيل الدخول',
                                style: TextStyles.bold16.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            'تسجيل الدخول',
                            style: TextStyles.bold16.copyWith(
                              color: Colors.white,
                            ),
                          ),
                  );
                },
              ),
              const SizedBox(height: 32),
              TermsOrAuthActionWidget(
                mainText: 'لا تمتلك حساب؟',
                actionText: ' قم بإنشاء حساب',
                onTap: () {
                  Navigator.of(context).pushNamed(SignupView.routesSignUp);
                },
              ),
              const SizedBox(height: 49),
              const OrDivider(),
              const SizedBox(height: 16),
              BlocConsumer<SocialAuthCubit, SocialAuthState>(
                listener: (context, state) {
                  if (state is SocialAuthSuccess) {
                    Navigator.pushReplacementNamed(context, HomeView.routeHome);
                  }
                  if (state is SocialAuthFailure) {
                    buildErrorBar(context, state.failure);
                  }
                },
                builder: (context, state) {
                  final isGoogleLoading =
                      state is SocialAuthLoading &&
                      state.provider == SocialProvider.google;

                  final isFacebookLoading =
                      state is SocialAuthLoading &&
                      state.provider == SocialProvider.facebook;

                  final isAppleLoading =
                      state is SocialAuthLoading &&
                      state.provider == SocialProvider.apple;
                  return Column(
                    children: [
                      SocialLoginButton(
                        title: 'تسجيل بواسطة جوجل',
                        image: 'assets/images/google_icon.svg',
                        onPrissed: isGoogleLoading
                            ? () {}
                            : () {
                                context
                                    .read<SocialAuthCubit>()
                                    .signInWithGoogle();
                              },
                      ),
                      const SizedBox(height: 16),
                      SocialLoginButton(
                        title: 'تسجيل بواسطة أبل',
                        image: 'assets/images/apple_icon.svg',
                        onPrissed: () {},
                      ),
                      const SizedBox(height: 16),
                      SocialLoginButton(
                        title: 'تسجيل بواسطة فيسبوك',
                        image: 'assets/images/facebook_icon.svg',
                        onPrissed: isFacebookLoading
                            ? () {}
                            : () {
                                context
                                    .read<SocialAuthCubit>()
                                    .signInWithFacebook();
                              },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
