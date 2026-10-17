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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            color: Colors.black.withValues(alpha: 0.20),
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x0A20221F),
            blurRadius: 9,
            offset: Offset(0, 5),
            spreadRadius: 0,
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
