import 'package:datacaixa/common/database_strings.dart' as c;
import 'dart:convert';
import 'package:datacaixa/models/product.dart';

OrderItem orderItemFromJson(String str) => OrderItem.fromJson(json.decode(str));

String orderItemToJson(OrderItem data) => json.encode(data.toJson());

class OrderItem {
  int identifier;
  int hotelId;
  int orderItemId;
  int orderId;
  int productId;
  Product product;
  int userId;
  int sequence;
  String entryDateTime;
  String deliveryDateTime;
  double quantity;
  double  unitValue;
  double totalValue;
  double generalTotalValue;
  String canceled;
  int preparingTime;
  String comment;
  String printed;
  double discount;
  double discountValue;
  double accrual;
  double accrualValue;
  List<OrderItem> orderItems;

  OrderItem();
  OrderItem.add({this.identifier, this.hotelId, this.orderItemId, this.orderId,
      this.productId, this.sequence, this.quantity, this.unitValue, this.userId,
      this.totalValue, this.product, this.orderItems, this.entryDateTime});

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      c.hotelId: hotelId,
      c.orderItemId: orderItemId,
      c.orderId: orderId,
      c.productId: productId,
      c.sequence: sequence,
      c.quantity: quantity,
      c.unitValue: unitValue,
      c.totalValue: totalValue,
    };
    if(identifier != null){
      map[c.identifier] = identifier;
    }
    return map;
  }

  OrderItem.fromMap(Map<String, dynamic> map) {
    identifier = map[c.identifier];
    orderItemId = map[c.orderItemId];
    orderId = map[c.orderId];
    productId = map[c.productId];
    sequence = map[c.sequence];
    quantity = map[c.quantity];
    unitValue = map[c.unitValue];
    totalValue = map[c.totalValue];
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem.add(
    orderItemId: json["id"],
    orderId: json["pedido"],
    product: Product.fromJson(json["produto"]),
    sequence: json["sequencia"],
    quantity: json["quantidade"].toDouble(),
    unitValue: json["valor_unitario"].toDouble(),
    totalValue: json["valor_total"].toDouble(),
    userId: json["usuario"],
    entryDateTime: json["data_lancto"]
  );

  Map<String, dynamic> toJson() => {
    "id_produto": productId,
    "quantidade": quantity,
    "usuario": userId,
  };

  @override
  String toString() {
    return 'OrderItem{identifier: $identifier, hotelId: $hotelId, orderItemId: $orderItemId, orderId: $orderId, productId: $productId, product: $product, userId: $userId, sequence: $sequence, entryDateTime: $entryDateTime, deliveryDateTime: $deliveryDateTime, quantity: $quantity, unitValue: $unitValue, totalValue: $totalValue, generalTotalValue: $generalTotalValue, canceled: $canceled, preparingTime: $preparingTime, comment: $comment, printed: $printed, discount: $discount, discountValue: $discountValue, accrual: $accrual, accrualValue: $accrualValue, orderItems: $orderItems}';
  }
}