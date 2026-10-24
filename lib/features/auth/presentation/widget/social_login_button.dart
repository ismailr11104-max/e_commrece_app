import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.title,
    required this.image,
    required this.onPrissed,
  });

  final String title;
  final String image;
  final VoidCallback onPrissed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: AppSizes.borderR16,
            side: const BorderSide(width: 1, color: Color(0xffDDDFDF)),
          ),
          padding: EdgeInsets.symmetric(vertical: AppSizes.h12, horizontal: AppSizes.s16),
        ),
        onPressed: onPrissed,
        child: Row(
          children: [
            SvgPicture.asset(image),
            const Expanded(child: SizedBox()),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold16,
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
