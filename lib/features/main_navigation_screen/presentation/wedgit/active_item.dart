import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 48.h,
        padding: AppSizes.horizontalP16,
        decoration: ShapeDecoration(
          color: const Color(0xFF56A25F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset(image, width: AppSizes.iconSmall, height: AppSizes.iconSmall)),
            SizedBox(width: AppSizes.s8),
            Text(
              text,
              style: TextStyles.semiBold11.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
