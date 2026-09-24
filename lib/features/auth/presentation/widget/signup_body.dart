import 'package:e_commrece_app/core/helper_functions/build_error_bar.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/validators/email_validator.dart';
import 'package:e_commrece_app/core/validators/name_validator.dart';
import 'package:e_commrece_app/core/validators/password_validator.dart';
import 'package:e_commrece_app/core/widget/custom_button.dart';
import 'package:e_commrece_app/core/widget/custom_password_from_field.dart';
import 'package:e_commrece_app/core/widget/custom_text_from_field.dart';
import 'package:e_commrece_app/features/auth/presentation/controller/sign_up_cupit/sign_up_auth_cubit.dart';
import 'package:e_commrece_app/features/auth/presentation/widget/terms_and_condition_widget.dart';
import 'package:e_commrece_app/features/auth/presentation/widget/terms_or_auth_action_widget.dart';
import 'package:e_commrece_app/features/home/presentation/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBody extends StatefulWidget {
  SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isTermsAccepted = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
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
                controller: nameController,
                validator: NameValidator.validate,
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomTextFromField(
                validator: EmailValidator.validate,
                controller: emailController,
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              CustomPasswordFromField(
                validator: PasswordValidator.validate,
                controller: passwordController,
              ),
              SizedBox(height: 16),
              TermsAndConditionsWidget(
                onChanged: (bool value) {
                  setState(() {
                    isTermsAccepted = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              BlocConsumer<EmailAuthCubit, EmailAuthState>(
                listener: (context, state) {
                  if (state is EmailAuthSuccess) {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(HomeView.routeHome);
                  }

                  if (state is EmailAuthFailure) {
                    buildErrorBar(context, state.failure);
                  }
                },
                builder: (context, state) {
                  final isLoading = state is EmailAuthLoading;
                  return CustomButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (formKey.currentState?.validate() ?? false) {
                              if (isTermsAccepted) {
                                context
                                    .read<EmailAuthCubit>()
                                    .createEmailAndPassword(
                                      email: emailController.text.trim(),
                                      password: passwordController.text,
                                      name: nameController.text.trim(),
                                    );
                              } else {
                                buildErrorBar(
                                  context,
                                  'يرجى الموافقة على الشروط والأحكام',
                                );
                              }
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
                                'إنشاء حساب جديد',
                                style: TextStyles.bold16.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            'إنشاء حساب جديد',
                            style: TextStyles.bold16.copyWith(
                              color: Colors.white,
                            ),
                          ),
                  );
                },
              ),
              const SizedBox(height: 26),
              TermsOrAuthActionWidget(
                mainText: 'تمتلك حساب بالفعل؟',
                actionText: 'تسجيل دخول',
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
