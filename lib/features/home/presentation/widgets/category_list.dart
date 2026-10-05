import 'package:e_commrece_app/core/utils/app_image.dart';
import 'package:e_commrece_app/core/widget/category_item_widget.dart';
import 'package:e_commrece_app/features/category/domain/entities/category_entities.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryEntities> categories;
  final VoidCallback onAllTap;
  final void Function(String categoryId) onCategoryTap;

  const CategoryList({
    super.key,
    required this.categories,
    required this.onAllTap,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CategoryItemWidget(
                title: 'الكل',
                isNetworkImage: false,
                imagePath: Assets.allProduct,
                onTap: onAllTap,
              ),
            );
          }

          final category = categories[index - 1];

          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CategoryItemWidget(
              title: category.name,
              isNetworkImage: true,
              imagePath: category.imageUrl!,
              onTap: () {
                onCategoryTap(category.code);
              },
            ),
          );
        },
      ),
    );
  }
}
