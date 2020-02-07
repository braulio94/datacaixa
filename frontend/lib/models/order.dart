import 'package:datacaixa/common/contants.dart' as c;

class Order {
  int hotelId;
  int orderId;
  int pdvId;
  int userId;
  int chargeId;
  int tableId;
  int clientId;
  //TODO add client here
  //TODO add order items here
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
    return map;
  }


  Order.add({this.hotelId, this.orderId, this.pdvId, this.userId, this.chargeId,
      this.tableId, this.clientId, this.accommodationId, this.roomId,
      this.accountTypeId, this.employeeId, this.openingDate, this.closingDate,
      this.totalAmount, this.serviceTax, this.generalTotalAmount, this.people,
      this.status, this.tableStatus, this.discountValue, this.accrualValue,
      this.comment, this.discount, this.accrual, this.delivererId,
      this.deliveryStatus, this.deliveryDate, this.deliveryTime, this.type});

  Order.fromMap(Map<String, dynamic> map) {
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

  List<String> columns(){
    return [
      c.hotelId,
      c.orderId,
      c.pdvId,
      c.userId,
      c.tableId,
      c.clientId,
      c.employeeId,
      c.openingDate,
      c.closingDate,
      c.totalValue,
      c.people,
      c.status,
      c.tableStatus,
      c.comment,
      c.deliverer,
      c.deliveryStatus,
      c.deliveryDate,
      c.deliveryTime,
      c.type
    ];
  }
}