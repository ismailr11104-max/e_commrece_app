import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.supTitle,
    super.key,
  });

  final String image, backgroundImage;
  final Widget title;
  final String supTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  'assets/images/page_view_item1_background_image.svg',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(
                  'assets/images/page_view_item1_image.svg',
                  width: 260,
                  height: 240,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'تخطي',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF949D9E),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 48),
        title,
        SizedBox(height: 16),
        Text(
          supTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13, color: Color(0xFF4E5556)),
        ),
      ],
    );
  }
}
