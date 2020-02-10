import 'package:datacaixa/common/contants.dart' as c;
import 'dart:convert';
import 'package:datacaixa/models/product.dart';

OrderItemList orderItemListFromJson(String str) => OrderItemList.fromJson(json.decode(str));

String orderItemListToJson(OrderItemList data) => json.encode(data.toJson());

class OrderItemList {
  List<OrderItem> orderItems;

  OrderItemList({
    this.orderItems,
  });

  factory OrderItemList.fromJson(Map<String, dynamic> json) => OrderItemList(
    orderItems: List<OrderItem>.from(json["pedido_itens"].map((x) => OrderItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pedido_itens": List<dynamic>.from(orderItems.map((x) => x.toJson())),
  };
}

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

  OrderItem();
  OrderItem.add({this.identifier, this.hotelId, this.orderItemId, this.orderId,
      this.productId, this.sequence, this.quantity, this.unitValue,
      this.totalValue, this.product});

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
    quantity: json["quantidade"],
    unitValue: json["valor_unitario"].toDouble(),
    totalValue: json["valor_total"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": orderItemId,
    "pedido": orderId,
    "produto": product.toJson(),
    "sequencia": sequence,
    "quantidade": quantity,
    "valor_unitario": unitValue,
    "valor_total": totalValue,
  };
}