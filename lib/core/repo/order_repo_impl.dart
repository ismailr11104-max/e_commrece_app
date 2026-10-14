import 'package:dartz/dartz.dart';
import 'package:e_commrece_app/core/errors/failures.dart';
import 'package:e_commrece_app/core/repo/order_repo.dart';
import 'package:e_commrece_app/core/services/network/fire_store_service.dart';
import 'package:e_commrece_app/core/utils/backend_endpoint.dart';
import 'package:e_commrece_app/features/checkout/data/model/order_model.dart';
import 'package:e_commrece_app/features/checkout/domain/entities/order_entities.dart';

class OrderRepoImpl implements OrderRepo {
  final FireStoreService _storeService;

  OrderRepoImpl(this._storeService);

  @override
  Future<Either<Failures, void>> addOrder({
    required OrderEntities orderEntity,
  }) async {
    try {
      final result = await _storeService.setData(
        path: BackendEndpoint.addOrder,
        data: OrderModel.fromMap(orderEntity).toMap(),
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
