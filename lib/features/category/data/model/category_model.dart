import 'package:e_commrece_app/features/category/domain/entities/category_entities.dart';

class CategoryModel extends CategoryEntities {
  CategoryModel({required super.name, required super.code, super.imageUrl});

  Map<String, dynamic> toMap() {
    return {'name': name, 'code': code, 'image': imageUrl};
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name']?.toString() ?? '',
      code: map['code']?.toString() ?? '',
      imageUrl: map['image']?.toString(),
    );
  }

  factory CategoryModel.fromEntity(CategoryEntities category) {
    return CategoryModel(
      name: category.name,
      code: category.code,
      imageUrl: category.imageUrl,
    );
  }
}
