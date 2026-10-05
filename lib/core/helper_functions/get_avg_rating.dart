import 'package:e_commrece_app/core/entities/review_entities.dart';

num getAvgRating(List<ReviewEntities> reviews) {
  var sum = 0.0;
  for (var avg in reviews) {
    sum += avg.rating;
  }
  return sum / reviews.length;
}
