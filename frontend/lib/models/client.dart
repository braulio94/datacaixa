import 'package:datacaixa/common/contants.dart' as c;
import 'dart:convert';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
  int identifier;
  int hotelId;
  int clientId;
  int groupId;
  int companyId;
  int cityId;
  String name;
  String cpf;
  String rg;
  String address;
  String completeAddress;
  String district;
  String cep;
  String phoneNumber;
  String fax;
  String email;
  String cellphoneNumber;
  String birthPlace;
  String maritalStatus;
  String partner;
  String job;
  String comment;
  String birthDate;
  String registerDate;
  String photo;
  String nationality;
  String gender;
  String passport;
  String sendSms;
  String sendEmail;
  String marriageDate;
  String dispatchingAgency;
  String syncCode;
  String creditTotal;
  String creditLimit;

  Client();

  Client.add({this.identifier, this.clientId, this.name, this.phoneNumber,
    this.gender, this.maritalStatus, this.registerDate, this.nationality});

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      c.identifier: identifier,
      c.clientId: clientId,
      c.name: name,
      c.phoneNumber: phoneNumber,
      c.gender: gender,
    };
    if(identifier != null){
      map[c.identifier] = identifier;
    }
    return map;
  }

  Client.fromMap(Map<String, dynamic> map){
    identifier = map[c.identifier];
    clientId = map[c.clientId];
    name = map[c.name];
    phoneNumber = map[c.phoneNumber];
    gender = map[c.gender];
  }

  factory Client.fromJson(Map<String, dynamic> json) => Client.add(
    clientId: json["id"],
    name: json["nome"],
    maritalStatus: json["estado_civil"],
    registerDate: json["data_cadastro"],
    nationality: json["nacionalidade"],
    gender: json["sexo"],
  );

  Map<String, dynamic> toJson() => {
    "id": clientId,
    "nome": name,
    "estado_civil": maritalStatus,
    "data_cadastro": registerDate,
    "nacionalidade": nationality,
    "sexo": gender,
  };

  @override
  String toString() {
    return 'Client{identifier: $identifier, clientId: $clientId, name: $name, phoneNumber: $phoneNumber}';
  }
}