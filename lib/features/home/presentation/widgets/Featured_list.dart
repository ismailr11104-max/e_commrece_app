import 'package:e_commrece_app/features/home/presentation/widgets/featured_item.dart';
import 'package:flutter/material.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    final widthItem = MediaQuery.sizeOf(context).width - 32;
    final heightItem = widthItem * 158 / 342;
    return SizedBox(
      height: heightItem,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const FeaturedItem();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8);
        },
      ),
    );
  }
}
