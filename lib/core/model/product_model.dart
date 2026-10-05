import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/core/helper_functions/get_avg_rating.dart';
import 'package:e_commrece_app/core/model/review_model.dart';

class ProductModel extends ProductEntities {
  const ProductModel({
    required super.name,
    required super.desc,
    required super.code,
    required super.price,
    super.imageUrl,
    super.sellingCount,
    required super.categoryId,
    required super.expirationsMonths,
    required super.numberOfCalories,
    required super.unitAmount,
    super.isOrganic,
    required super.reviews,
    required super.avgRating,
  });

  ProductEntities toEntities() {
    return ProductEntities(
      name: name,
      desc: desc,
      code: code,
      price: price,
      imageUrl: imageUrl,
      sellingCount: sellingCount,
      categoryId: categoryId,
      expirationsMonths: expirationsMonths,
      isOrganic: isOrganic,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      reviews: reviews,
      avgRating: avgRating,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avgRating': avgRating,
      'desc': desc,
      'code': code,
      'price': price,
      'sellingCount': sellingCount,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'expirationsMonths': expirationsMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'reviews': reviews
          .map((review) => ReviewModel.fromEntity(review).toMap())
          .toList(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      avgRating: getAvgRating(
        (map['reviews'] as List<dynamic>?)
                ?.map(
                  (review) => ReviewModel.fromMap(
                    Map<String, dynamic>.from(review as Map),
                  ),
                )
                .toList() ??
            [],
      ),
      name: map['name'] as String? ?? '',
      desc: map['desc'] as String? ?? '',
      code: map['code'] as String? ?? '',
      price: num.tryParse(map['price']?.toString() ?? '0') ?? 0,
      sellingCount:
          num.tryParse(map['sellingCount']?.toString() ?? '0')?.toInt() ?? 0,
      imageUrl: map['imageUrl'] as String?,
      categoryId: map['categoryId'] as String? ?? '',
      expirationsMonths:
          num.tryParse(map['expirationsMonths']?.toString() ?? '0')?.toInt() ??
          0,
      isOrganic: map['isOrganic'] as bool? ?? false,
      numberOfCalories:
          num.tryParse(map['numberOfCalories']?.toString() ?? '0')?.toInt() ??
          0,
      unitAmount:
          num.tryParse(map['unitAmount']?.toString() ?? '0')?.toInt() ?? 0,
      reviews:
          (map['reviews'] as List<dynamic>?)
              ?.map(
                (review) => ReviewModel.fromMap(
                  Map<String, dynamic>.from(review as Map),
                ),
              )
              .toList() ??
          [],
    );
  }
}
