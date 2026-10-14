import 'package:dartz/dartz.dart';
import 'package:e_commrece_app/core/errors/failures.dart';
import 'package:e_commrece_app/features/checkout/domain/entities/order_entities.dart';

abstract class OrderRepo {
  Future<Either<Failures, void>> addOrder({required OrderEntities orderEntity});
}
