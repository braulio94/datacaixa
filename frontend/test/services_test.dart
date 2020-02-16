import 'package:datacaixa/models/order.dart';
import 'package:datacaixa/models/order_item.dart';
import 'package:datacaixa/models/product.dart';
import 'package:datacaixa/models/product_group.dart';
import 'package:datacaixa/services/order_service.dart';
import 'package:datacaixa/services/product_service.dart';
import 'package:test/test.dart';

void main(){
  ProductService productService = ProductService();
  OrderService orderService = OrderService();

  test('Product test', () async {
    Product product = await productService.getProduct(408);
    expect('SAGRES PRETA LATA', product.description);
  });

  test('Product Group test', () async {
    List<ProductGroup> groups = await productService.getProductGroups();
    expect('HOSPEDAGENS', groups.first.description);
  });

  test('Products By Group test', () async {
    List<Product> products = await productService.getProductsByGroup(19, 1, 'sales');
    expect('FINO COPO', products.first.description);
  });

  test('Search Products test', () async {
    List<Product> products = await productService.searchProducts('PREGO');
    expect('PREGO NO PRATO PD', products.first.description);
  });

  test('Single Order test', () async {
    Order order = await orderService.getOrder(32280, 'yes');
    expect('BRAULIO', order.client.name);
  });

  test('Open Orders test', () async {
    List<Order> orders = await orderService.getOpenOrders();
    expect('WILSON WEMBA', orders.last.client.name);
  });

  test('Order Items test', () async {
    List<OrderItem> orderItems = await orderService.getOrderItems(32280);
    expect('EKA GARRAFA', orderItems.first.product.description);
  });

  test('Create Order test', () async {
    Order order = await orderService.createOrder(
      Order.add(
        hotelId: 1,
        pdvId: 1,
        userId: 2,
        tableId: 32,
        status: 'Aberto',
        clientId: 51,
        people: 13,
        tableStatus: 'Ocupada',
        type: 'MESA'
      )
    );
    expect(32290, order.orderId);
  });

  test('Create Order Items test', () async {
    int orderItemId = await orderService.createOrderItem();
    expect(12332, orderItemId);
  });
}