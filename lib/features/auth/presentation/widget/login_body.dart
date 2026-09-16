import 'package:e_commrece_app/core/utils/app_colors.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/custom_button.dart';
import 'package:e_commrece_app/core/widget/custom_text_from_field.dart';
import 'package:e_commrece_app/features/auth/presentation/screen/signup_view.dart';
import 'package:e_commrece_app/features/auth/presentation/widget/or_divider.dart';
import 'package:e_commrece_app/features/auth/presentation/widget/social_login_button.dart';
import 'package:e_commrece_app/features/auth/presentation/widget/terms_or_auth_action_widget.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            const CustomTextFromField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
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
            CustomButton(onPressed: () {}, text: 'تسجيل الدخول'),
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
            SocialLoginButton(
              title: 'تسجيل بواسطة جوجل',
              image: 'assets/images/google_icon.svg',
              onPrissed: () {},
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
              onPrissed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
