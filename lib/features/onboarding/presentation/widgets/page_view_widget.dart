import 'package:e_commrece_app/features/onboarding/presentation/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PageViewItem(
      image: 'assets/images/page_view_item1_image.svg',
      backgroundImage: 'assets/images/page_view_item1_background_image.svg',
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'مرحبًا بك في',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0C0D0D),
            ),
          ),
          Text(
            'HUB',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFFF4A91F),
            ),
          ),
          Text(
            'Fruit',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1B5E37),
            ),
          ),
        ],
      ),
      supTitle:
          'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف\nمجموعتنا الواسعة من الفواكه الطازجة الممتازة\n واحصل على أفضل العروض والجودة العالية.',
    );
  }
}
