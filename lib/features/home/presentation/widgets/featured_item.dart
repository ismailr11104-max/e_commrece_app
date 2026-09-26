import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/features/home/presentation/widgets/featured_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    final widthItem = MediaQuery.sizeOf(context).width - 32;
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(4),
      child: SizedBox(
        width: widthItem,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                top: 0,
                right: widthItem * .4,
                child: Image.asset(
                  'assets/images/fruits.png',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: widthItem * .5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg('assets/images/ellipse.svg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      Text(
                        'عروض العيد',
                        style: TextStyles.regular13.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'خصم 25%',
                        style: TextStyles.bold19.copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 11),
                      FeaturedItemButton(onPressed: () {}),
                      SizedBox(height: 29),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
