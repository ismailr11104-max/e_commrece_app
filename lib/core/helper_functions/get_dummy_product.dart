import '../entities/product_entities.dart';

ProductEntities getDummyData() {
  return ProductEntities(
    name: 'طماطم',
    desc: 'طماطم طازجة عالية الجودة ومناسبة للطبخ والسلطات',
    code: 'FRU-001',
    price: 10,
    categoryId: 'vegetables',
    expirationsMonths: 1,
    numberOfCalories: 18,
    unitAmount: 1,
    reviews: [],
    avgRating: 3,
  );
}

final List<ProductEntities> getDummyProduct = [
  getDummyData(),
  getDummyData(),
  getDummyData(),
  getDummyData(),
  getDummyData(),
  getDummyData(),
  getDummyData(),
  getDummyData(),
  getDummyData(),
];
