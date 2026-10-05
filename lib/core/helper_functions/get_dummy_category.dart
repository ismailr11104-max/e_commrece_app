import 'package:e_commrece_app/features/category/domain/entities/category_entities.dart';

CategoryEntities getDummyCategory() {
  return CategoryEntities(
    name: 'طماطم',
    code: 'طماطم',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOd1Im5E9tSz6ITdT2uzgykTDWwiyqqyakgj87P5IZYniWucfwIbhRhK4&s=10'
            as dynamic,
  );
}

final List<CategoryEntities> dummyItems = [
  getDummyCategory(),
  getDummyCategory(),
  getDummyCategory(),
  getDummyCategory(),
  getDummyCategory(),
];
