import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/featured_item_button.dart';
import 'package:flutter/material.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 364,
        height: 220,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.50, 0.00),
            end: Alignment(0.50, 1.00),
            colors: [Color(0xFF56A25F), Color(0xFF34653A)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: -32,
              top: 0,
              bottom: 0,
              child: Container(
                width: 193,
                height: 193,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/basket1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 24,
              top: 30,
              child: SizedBox(
                width: 204,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
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
                          SizedBox(height: 4),
                          SizedBox(
                            width: 204,
                            child: Text(
                              textAlign: TextAlign.right,
                              'مباشرة من المزرعة',
                              style: TextStyles.bold16.copyWith(
                                color: Color(0xFFFAD02E),
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
