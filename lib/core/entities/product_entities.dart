import 'package:e_commrece_app/core/entities/review_entities.dart';
import 'package:equatable/equatable.dart';

class ProductEntities extends Equatable {
  final String name;
  final String desc;
  final String code;
  final num price;
  final String? imageUrl;
  final String categoryId;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final int sellingCount;
  final List<ReviewEntities> reviews;

  const ProductEntities({
    required this.name,
    required this.desc,
    required this.code,
    required this.price,
    this.imageUrl,
    required this.avgRating,
    this.sellingCount = 0,
    required this.categoryId,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
    required this.reviews,
  });

  @override
  List<Object?> get props => [
    name,
    desc,
    code,
    price,
    imageUrl,
    categoryId,
    expirationsMonths,
    isOrganic,
    numberOfCalories,
    unitAmount,
    reviews,
  ];
}
