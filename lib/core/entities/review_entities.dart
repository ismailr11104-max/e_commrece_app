import 'package:equatable/equatable.dart';

class ReviewEntities extends Equatable {
  final String name;
  final String image;
  final num rating;
  final String data;
  final String comment;

  const ReviewEntities({
    required this.name,
    required this.image,
    required this.rating,
    required this.data,
    required this.comment,
  });

  ReviewEntities toEntities() {
    return ReviewEntities(
      name: name,
      image: image,
      rating: rating,
      data: data,
      comment: comment,
    );
  }

  @override
  List<Object> get props => [name, image, rating, data, comment];
}
