import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageProductDetails extends StatelessWidget {
  const ImageProductDetails({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.h,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.s8, vertical: 5.h),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.50, 1.02),
          end: Alignment(0.50, -0.00),
          colors: [Color(0xFFFFF3C5), Color(0xFFFDF9DA)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: AppSizes.radius12,
            bottomRight: AppSizes.radius12,
          ),
        ),
      ),
      child: Image.network(
        image,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.broken_image, size: AppSizes.iconLarge * 1.5, color: Colors.grey),
      ),
    );
  }
}
