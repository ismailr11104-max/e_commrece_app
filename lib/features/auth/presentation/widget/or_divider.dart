import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xffDDDFDF), thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            'أو',
            style: TextStyles.semiBold16.copyWith(color: Color(0xff0C0D0D)),
          ),
        ),
        Expanded(child: Divider(color: Color(0xffDDDFDF), thickness: 1)),
      ],
    );
  }
}
