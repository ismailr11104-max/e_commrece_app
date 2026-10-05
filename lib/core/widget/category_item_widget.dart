import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;
  final bool isNetworkImage;

  const CategoryItemWidget({
    super.key,
    required this.title,
    required this.imagePath,
    this.onTap,
    this.isNetworkImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              color: Color(0xFFF3F5F7),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: isNetworkImage
                  ? Image.network(
                      imagePath,
                      fit: BoxFit.contain,
                      width: 36,
                      height: 36,
                    )
                  : Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                      width: 36,
                      height: 36,
                    ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyles.semiBold13.copyWith(color: Color(0xff0C0D0D)),
          ),
        ],
      ),
    );
  }
}
