import 'package:datacaixa/common/contants.dart' as c;

class OrderItem {
  int identifier;
  int hotelId;
  int orderItemId;
  int orderId;
  int productId;
  //TODO add product
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
      this.totalValue});

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
}