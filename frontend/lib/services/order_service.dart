import 'package:datacaixa/common/api_routes.dart';
import 'package:datacaixa/models/order.dart';
import 'package:datacaixa/models/order_item.dart';
import 'package:datacaixa/services/base_service.dart';
import 'dart:convert';
import 'package:http/http.dart';

class OrderService extends BaseService {

  getOrder(int id, String displayItems) async {
    var uri = Uri.http(HOST, ORDER + '/$id', {WITH_ITEMS: displayItems});
    Response response = await client.get(uri) ;
    return Order.fromJson(json.decode(response.body)["pedido"]);
  }

  getOpenOrders() async {
    var uri = Uri.http(HOST, ORDERS);
    Response response = await client.get(uri);
    return List<Order>.from(json.decode(response.body)["pedidos"].map((x) => Order.fromJson(x)));
  }

  getOrderItems(int orderId) async {
    var uri = Uri.http(HOST, ORDER + '/$orderId' + ORDER_ITEMS);
    Response response = await client.get(uri);
    return List<OrderItem>.from(json.decode(response.body)["pedido_itens"].map((x) => OrderItem.fromJson(x)));
  }

  createOrder(Order newOrder) async {
    var uri = Uri.http(HOST, ORDER);
    Response response = await client.put(uri, body: json.encode(newOrder.toJson()));
    return Order.fromJson(json.decode(response.body)["pedido"]);
  }

  createOrderItem(OrderItem newOrderItem) async {
    var uri = Uri.http(HOST, ORDER + '/${newOrderItem.orderId}' + ORDER_ITEM);
    Response response = await client.put(uri, body: json.encode(newOrderItem.toJson()));
    return OrderItem.fromJson(json.decode(response.body)["item"]);
  }

  //TODO create below methods
  updateOrder(){

  }

  updateOrderItem(){

  }
}