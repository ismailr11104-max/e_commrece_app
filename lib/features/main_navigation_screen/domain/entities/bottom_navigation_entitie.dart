import 'package:e_commrece_app/core/utils/app_image.dart';

class BottomNavigationEntities {
  final String active, nonActive;
  final String name;

  const BottomNavigationEntities({
    required this.active,
    required this.nonActive,
    required this.name,
  });
}

List<BottomNavigationEntities> bottomNavigationItem = [
  BottomNavigationEntities(
    active: Assets.imagesHomeActive,
    nonActive: Assets.imagesHomeNonActive,
    name: 'الرئيسية',
  ),
  BottomNavigationEntities(
    active: Assets.imagesElementActive,
    nonActive: Assets.imagesElementNonActive,
    name: 'المنتجات',
  ),
  BottomNavigationEntities(
    active: Assets.imagesShoppingActive,
    nonActive: Assets.imagesShoppingNonActive,
    name: 'سلة التسوق',
  ),
  BottomNavigationEntities(
    active: Assets.imagesUserActive,
    nonActive: Assets.imagesUserNonActive,
    name: 'حسابي',
  ),
];
