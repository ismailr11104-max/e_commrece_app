import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class FilterProduct extends StatelessWidget {
  const FilterProduct({super.key, required this.ProductLength});

  final int ProductLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'نتائج البحث (${ProductLength})',
          style: TextStyles.bold16.copyWith(color: Color(0xff0C0D0D)),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt_outlined)),
      ],
    );
  }
}
