import 'package:e_commrece_app/core/entities/review_entities.dart';

class ReviewModel extends ReviewEntities {
  const ReviewModel({
    required super.name,
    required super.image,
    required super.rating,
    required super.data,
    required super.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'rating': rating,
      'data': data,
      'comment': comment,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      name: map['name'] as String,
      image: map['image'] as String,
      rating: map['rating'] as num,
      data: map['data'] as String,
      comment: map['comment'] as String,
    );
  }

  factory ReviewModel.fromEntity(ReviewEntities entity) {
    return ReviewModel(
      name: entity.name,
      image: entity.image,
      rating: entity.rating,
      data: entity.data,
      comment: entity.comment,
    );
  }

  ReviewModel copyWith({
    String? name,
    String? image,
    num? rating,
    String? data,
    String? comment,
  }) {
    return ReviewModel(
      name: name ?? this.name,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      data: data ?? this.data,
      comment: comment ?? this.comment,
    );
  }
}
