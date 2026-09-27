import 'package:e_commrece_app/features/main_navigation_screen/domain/entities/bottom_navigation_entitie.dart';
import 'package:e_commrece_app/features/main_navigation_screen/presentation/wedgit/naivation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: List.generate(bottomNavigationItem.length, (index) {
          final item = bottomNavigationItem[index];
          final isSelected = selectedIndex == index;

          return Expanded(
            flex: isSelected ? 3 : 2,
            child: GestureDetector(
              onTap: () => onItemTapped(index),
              child: NavigationBarItem(
                isSelected: isSelected,
                bottomNavigationBarEntity: item,
              ),
            ),
          );
        }),
      ),
    );
  }
}
