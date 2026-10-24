import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.s12, vertical: AppSizes.s8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0xFFCCC7C0)),
          borderRadius: AppSizes.borderR12,
        ),
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: AppSizes.s20,
            child: Center(
              child: SvgPicture.asset('assets/images/search-normal.svg'),
            ),
          ),
          suffixIcon: SizedBox(
            width: AppSizes.s20,
            child: Center(child: SvgPicture.asset('assets/images/filter.svg')),
          ),
          hintStyle: TextStyles.regular13.copyWith(
            color: const Color(0xFF949D9E),
          ),
          hintText: 'ابحث عن.......',
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: AppSizes.borderR4,
      borderSide: const BorderSide(width: 1, color: Colors.white),
    );
  }
}
