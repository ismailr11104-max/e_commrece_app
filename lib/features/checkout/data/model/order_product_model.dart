import 'package:e_commrece_app/features/shopping/domain/cart_entities.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromEntity({required CartEntities cartItemEntity}) {
    return OrderProductModel(
      name: cartItemEntity.productEntities.name,
      code: cartItemEntity.productEntities.code,
      imageUrl: cartItemEntity.productEntities.imageUrl!,
      price: cartItemEntity.productEntities.price.toDouble(),
      quantity: cartItemEntity.quantity,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}
