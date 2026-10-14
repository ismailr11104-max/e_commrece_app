import 'package:e_commrece_app/features/checkout/domain/entities/order_entities.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };

  factory DetailsEntity.fromEntity(OrderEntities entity) => DetailsEntity(
    subtotal: entity.cartItemEntities.calculateTotal().toString(),
    shipping: entity.calculateShippingCost().toString(),
    shippingDiscount: entity.calcualteShippingDiscount(),
  );
}
