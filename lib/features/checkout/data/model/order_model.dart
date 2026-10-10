import 'package:e_commrece_app/features/checkout/data/model/address_model.dart';
import 'package:e_commrece_app/features/checkout/data/model/order_product_model.dart';
import 'package:e_commrece_app/features/checkout/domain/order_entities.dart';

class OrderModel {
  final String uid;
  final double totalPrice;
  final AddressModel addressModel;
  final List<OrderProductModel> orderProductModel;
  final String paymentMethod;

  const OrderModel({
    required this.uid,
    required this.totalPrice,
    required this.addressModel,
    required this.orderProductModel,
    required this.paymentMethod,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'totalPrice': this.totalPrice,
      'addressModel': this.addressModel,
      'orderProductModel': this.orderProductModel,
      'paymentMethod': this.paymentMethod,
    };
  }

  factory OrderModel.fromMap(OrderEntities map) {
    return OrderModel(
      uid: map.uId,
      totalPrice: map.cartItemEntities.calculateTotal(),
      addressModel: AddressModel.fromEntity(map.addressEntities),
      orderProductModel: map.cartItemEntities.cartItem
          .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
          .toList(),
      paymentMethod: map.payWithCash! ? 'Cash' : 'Paypal',
    );
  }
}
