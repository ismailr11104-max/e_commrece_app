import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem({super.key, required this.title, required this.index});
  final String title;
  final String index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: Color(0xffF2F3F3),
          child: Text(
            index,
            style: TextStyles.semiBold13.copyWith(color: Color(0xff0C0D0D)),
          ),
        ),
        SizedBox(width: 4),
        Text(
          title,
          style: TextStyles.bold13.copyWith(color: Color(0xffAAAAAA)),
        ),
      ],
    );
  }
}
