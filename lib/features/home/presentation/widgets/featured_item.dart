import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/featured_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 364.w,
        height: 220.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.50, 0.00),
            end: Alignment(0.50, 1.00),
            colors: [Color(0xFF56A25F), Color(0xFF34653A)],
          ),
          shape: RoundedRectangleBorder(borderRadius: AppSizes.borderR12),
        ),
        child: Stack(
          children: [
            Positioned(
              left: -32.w,
              top: 0.w,
              bottom: 0.h,
              child: Container(
                width: 193.w,
                height: 193.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/basket1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 24.w,
              top: 30.h,
              child: SizedBox(
                width: 204.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'طازج يصلك حتى بابك',
                            style: TextStyles.semiBold16.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: AppSizes.h4),
                          SizedBox(
                            width: 204.w,
                            child: Text(
                              textAlign: TextAlign.right,
                              'مباشرة من المزرعة',
                              style: TextStyles.bold16.copyWith(
                                color: const Color(0xFFFAD02E),
                                fontSize: AppSizes.font22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSizes.h16),
                    FeaturedItemButton(onPressed: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
