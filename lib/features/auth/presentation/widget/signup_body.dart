import 'package:e_commrece_app/core/widget/custom_button.dart';
import 'package:e_commrece_app/core/widget/custom_text_from_field.dart';
import 'package:e_commrece_app/features/auth/presentation/screen/login_view.dart';
import 'package:e_commrece_app/features/auth/presentation/widget/terms_and_condition_widget.dart';
import 'package:e_commrece_app/features/auth/presentation/widget/terms_or_auth_action_widget.dart';
import 'package:flutter/material.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            const CustomTextFromField(
              hintText: 'الاسم كامل',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            const CustomTextFromField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 16),
            const CustomTextFromField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: const Icon(
                Icons.remove_red_eye_outlined,
                color: Color(0xffC9CECF),
              ),
            ),
            SizedBox(height: 16),
            TermsAndConditionWidget(),
            const SizedBox(height: 32),
            CustomButton(onPressed: () {}, text: 'إنشاء حساب جديد'),
            const SizedBox(height: 26),
            TermsOrAuthActionWidget(
              mainText: 'تمتلك حساب بالفعل؟',
              actionText: 'تسجيل دخول',
              onTap: () {
                Navigator.of(context).pop(LoginView.routeLogin);
              },
            ),
          ],
        ),
      ),
    );
  }
}
