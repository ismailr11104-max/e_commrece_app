import 'package:e_commrece_app/core/utils/abb_decorations.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.bold13),
        SizedBox(height: 8),
        Container(decoration: AbbDecorations.greyBoxDecorations, child: child),
      ],
    );
  }
}
