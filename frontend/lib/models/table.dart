import 'package:datacaixa/common/database_strings.dart' as c;

class Table {
  int identifier;
  int hotelId;
  int pdvId;
  int tableId;
  int number;
  int orderId;
  String status;
  String birthDayPerson;
  String vip;
  String honeyMoon;
  String pdv;
  String seats;
  double totalAmount;

  Table();

  Table.add({this.identifier, this.hotelId, this.pdvId, this.tableId, this.number, this.status,
      this.birthDayPerson, this.vip, this.honeyMoon, this.pdv, this.seats, this.orderId, this.totalAmount});

  bool get hasOrder => orderId != null;

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      c.hotelId: hotelId,
      c.pdvId: pdvId,
      c.tableId: tableId,
      c.number: number,
      c.status: status,
      c.orderId: orderId,
      c.totalValue: totalAmount,
    };
    if(identifier != null){
      map[c.identifier] = identifier;
    }
    return map;
  }

  Table.fromMap(Map<String, dynamic> map) {
    identifier = map[c.identifier];
    hotelId = map[c.hotelId];
    pdvId = map[c.pdvId];
    tableId = map[c.tableId];
    number = map[c.number];
    status = map[c.status];
    orderId = map[c.orderId];
    totalAmount = map[c.totalValue];
  }

  factory Table.fromJson(Map<String, dynamic> json) => Table.add(
    tableId: json["id_mesa"],
    number: json["numero"],
    status: json["situacao"],
    orderId: json["id_pedido"],
    totalAmount: json["valor_total"]!= null ? json["valor_total"].toDouble() : null,
  );

  @override
  String toString() {
    return 'Table{identifier: $identifier, hotelId: $hotelId, pdvId: $pdvId, tableId: $tableId, number: $number, status: $status, birthDayPerson: $birthDayPerson, vip: $vip, honeyMoon: $honeyMoon, pdv: $pdv, seats: $seats}';
  }
}

enum TableStatus {
  Busy,
  Idle
}