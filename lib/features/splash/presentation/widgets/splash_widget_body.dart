import 'package:e_commrece_app/core/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashWidgetBody extends StatelessWidget {
  const SplashWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,
      height: 130.h,
      child: Image.asset(Assets.imageSplash, fit: BoxFit.contain),
    );
  }
}
