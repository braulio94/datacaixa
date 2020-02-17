import 'package:datacaixa/models/client.dart';
import 'package:datacaixa/models/order.dart';
import 'package:datacaixa/models/order_item.dart';
import 'package:datacaixa/models/product.dart';
import 'package:datacaixa/models/product_group.dart';
import 'package:datacaixa/models/table.dart';
import 'package:datacaixa/services/client_service.dart';
import 'package:datacaixa/services/order_service.dart';
import 'package:datacaixa/services/product_service.dart';
import 'package:datacaixa/services/table_service.dart';
import 'package:test/test.dart';

void main(){
  ProductService productService = ProductService();
  OrderService orderService = OrderService();
  TableService tableService = TableService();
  ClientService clientService = ClientService();

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
    expect('Ocupada', order.status);
  });

  test('Create Order Items test', () async {
    OrderItem orderItem = await orderService.createOrderItem(
      OrderItem.add(
        orderId: 32280,
        productId: 92,
        quantity: 5,
        userId: 6,
      )
    );
    print(orderItem);
    expect(1800, orderItem.product.price);
  });

  test('Single Table test', () async {
    Table table = await tableService.getTable(8);
    expect('Livre', table.status);
  });

  test('All Tables test', () async {
    List<Table> tables = await tableService.getTables();
    expect(48, tables.last.tableId);
  });

  test('Single Client test', () async {
    Client client = await clientService.getClient(104);
    expect('BRAULIO', client.name);
  });

  test('Clients test', () async {
    List<Client> clients = await clientService.getClients(2);
    expect('ERICA', clients.first.name);
  });

  test('Search Client test', () async {
    List<Client> clients = await clientService.searchClient('TIO');
    expect('TIO BRAVO', clients.first.name);
  });

  
}