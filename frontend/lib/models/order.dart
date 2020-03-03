import 'package:datacaixa/common/database_strings.dart' as c;

import 'dart:convert';

import 'package:datacaixa/models/client.dart';
import 'package:datacaixa/models/order_item.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

OrderList orderListFromJson(String str) => OrderList.fromJson(json.decode(str));

String orderListToJson(OrderList data) => json.encode(data.toJson());

class OrderList {
  List<Order> orders;

  OrderList({
    this.orders,
  });

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
    orders: List<Order>.from(json["pedidos"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pedidos": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class Order {
  int identifier;
  int hotelId;
  int orderId;
  int pdvId;
  int userId;
  int chargeId;
  int tableId;
  int clientId;
  int accommodationId;
  int roomId;
  int accountTypeId;
  int employeeId;
  String openingDate;
  String closingDate;
  double totalAmount;
  double serviceTax;
  double generalTotalAmount;
  int people;
  Client client;
  String status;
  String tableStatus;
  String discountValue;
  double accrualValue;
  String comment;
  double discount;
  double accrual;
  int delivererId;
  String deliveryStatus;
  String deliveryDate;
  String deliveryTime;
  String type;
  List<OrderItem> orderItems;

  Order();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      c.hotelId: hotelId,
      c.orderId: orderId,
      c.pdvId: pdvId,
      c.userId: userId,
      c.tableId: tableId,
      c.clientId: clientId,
      c.employeeId: employeeId,
      c.openingDate: openingDate,
      c.closingDate: closingDate,
      c.totalValue: totalAmount,
      c.people: people,
      c.status: status,
      c.tableStatus: tableStatus,
      c.comment: comment,
      c.deliverer: delivererId,
      c.deliveryStatus: deliveryStatus,
      c.deliveryDate: deliveryDate,
      c.deliveryTime: deliveryTime,
      c.type: type,
    };
    if(identifier != null){
      map[c.identifier] = identifier;
    }
    return map;
  }


  Order.add({this.identifier, this.hotelId, this.orderId, this.pdvId, this.userId, this.chargeId,
      this.tableId, this.clientId, this.accommodationId, this.roomId, this.orderItems,
      this.accountTypeId, this.employeeId, this.openingDate, this.closingDate,
      this.totalAmount, this.serviceTax, this.generalTotalAmount, this.people,
      this.status, this.tableStatus, this.discountValue, this.accrualValue,
      this.comment, this.discount, this.accrual, this.delivererId, this.client,
      this.deliveryStatus, this.deliveryDate, this.deliveryTime, this.type});

  Order.fromMap(Map<String, dynamic> map) {
    identifier = map[c.identifier];
    hotelId = map[c.hotelId];
    orderId = map[c.orderId];
    pdvId = map[c.pdvId];
    userId = map[c.userId];
    tableId = map[c.tableId];
    clientId = map[c.clientId];
    employeeId = map[c.employeeId];
    openingDate = map[c.openingDate];
    closingDate = map[c.closingDate];
    totalAmount = map[c.totalValue];
    people = map[c.people];
    status = map[c.status];
    tableStatus = map[c.tableStatus];
    comment = map[c.comment];
    delivererId = map[c.deliverer];
    deliveryStatus = map[c.deliveryStatus];
    deliveryDate = map[c.deliveryDate];
    deliveryTime = map[c.deliveryTime];
    type = map[c.type];
  }

  factory Order.fromJson(Map<String, dynamic> json) => Order.add(
    orderId: json["id"],
    userId: json["usuario"],
    tableId: json["mesa"],
    clientId: json["id_cliente"],
    client: Client.fromJson(json["client"]).clientId != null ? Client.fromJson(json["client"]) : null,
    openingDate: json["data_abertura"],
    totalAmount: json["valor_total_geral"] != null ? json["valor_total_geral"].toDouble() : 0.0,
    tableStatus: json["situacao_mesa"],
    orderItems: json["pedido_itens"] != null ? List<OrderItem>.from(json["pedido_itens"].map((x) => OrderItem.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "hotel": hotelId,
    "pdv": pdvId,
    "usuario": userId,
    "mesa": tableId,
    "situacao": status,
    "id_cliente": clientId,
    "quantidade_pessoas": people,
    "situacao_mesa": tableStatus,
    "tipo": type,
  };

  @override
  String toString() {
    return 'Order{identifier: $identifier, \nhotelId: $hotelId, \norderId: $orderId, \npdvId: $pdvId, \nuserId: $userId, \nchargeId: $chargeId, \ntableId: $tableId, \nclientId: $clientId, \naccommodationId: $accommodationId, \nroomId: $roomId, \naccountTypeId: $accountTypeId, \nemployeeId: $employeeId, \nopeningDate: $openingDate, \nclosingDate: $closingDate, \ntotalAmount: $totalAmount, \nserviceTax: $serviceTax, \ngeneralTotalAmount: $generalTotalAmount, \npeople: $people, \nstatus: $status, \ntableStatus: $tableStatus, \ndiscountValue: $discountValue, \naccrualValue: $accrualValue, \ncomment: $comment, \ndiscount: $discount, \naccrual: $accrual, \ndelivererId: $delivererId, \ndeliveryStatus: $deliveryStatus, \ndeliveryDate: $deliveryDate, \ndeliveryTime: $deliveryTime, \ntype: $type, \nclient: ${client.toString()}, \norderItems: ${orderItems.toString()}';
  }
}