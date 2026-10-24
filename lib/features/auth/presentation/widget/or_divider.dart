import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xffDDDFDF), thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.s18),
          child: Text(
            'أو',
            style: TextStyles.semiBold16.copyWith(color: const Color(0xff0C0D0D)),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xffDDDFDF), thickness: 1)),
      ],
    );
  }
}
