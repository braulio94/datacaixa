import 'package:datacaixa/common/contants.dart' as c;

class Table {
  int identifier;
  int hotelId;
  int pdvId;
  int tableId;
  int number;
  String status;
  String birthDayPerson;
  String vip;
  String honeyMoon;
  String pdv;
  String seats;

  Table();

  Table.add({this.identifier, this.hotelId, this.pdvId, this.tableId, this.number, this.status,
      this.birthDayPerson, this.vip, this.honeyMoon, this.pdv, this.seats});

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      c.hotelId: hotelId,
      c.pdvId: pdvId,
      c.tableId: tableId,
      c.number: number,
      c.status: status,
      c.birthDayPerson: birthDayPerson,
      c.vip: vip,
      c.honeyMoon: honeyMoon,
      c.pdv: pdv,
      c.seats: seats,
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
    birthDayPerson = map[c.birthDayPerson];
    vip = map[c.vip];
    honeyMoon = map[c.honeyMoon];
    pdv = map[c.pdv];
    seats = map[c.seats];
  }

  factory Table.fromJson(Map<String, dynamic> json) => Table.add(
    tableId: json["id_mesa"],
    number: json["numero"],
    status: json["situacao"],
  );

  Map<String, dynamic> toJson() => {
    "id_mesa": tableId,
    "numero": number,
    "situacao": status,
  };

  @override
  String toString() {
    return 'Table{identifier: $identifier, hotelId: $hotelId, pdvId: $pdvId, tableId: $tableId, number: $number, status: $status, birthDayPerson: $birthDayPerson, vip: $vip, honeyMoon: $honeyMoon, pdv: $pdv, seats: $seats}';
  }
}