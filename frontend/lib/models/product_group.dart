import 'package:datacaixa/common/contants.dart' as c;
import 'package:datacaixa/models/product.dart';
import 'dart:convert';

ProductGroup productGroupFromJson(String str) => ProductGroup.fromJson(json.decode(str));

String productGroupToJson(ProductGroup data) => json.encode(data.toJson());

class ProductGroup {
  int identifier;
  int hotelId;
  int productGroupId;
  String description;
  String display;
  int code;
  String printer1;
  String printer2;
  List<Product> products;

  ProductGroup();

  ProductGroup.add({this.hotelId, this.productGroupId, this.description,
      this.display, this.code, this.products});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      c.hotelId: hotelId,
      c.productGroupId: productGroupId,
      c.description: description,
      c.display: display,
      c.code: code,
    };
    if(c.identifier != null){
      map[c.identifier] = identifier;
    }
    return map;
  }

  ProductGroup.fromMap(Map<String, dynamic> map){
    identifier = map[c.identifier];
    hotelId = map[c.hotelId];
    productGroupId = map[c.productGroupId];
    description = map[c.description];
    display = map[c.display];
    code = map[c.display];
  }

  factory ProductGroup.fromJson(Map<String, dynamic> json) => ProductGroup.add(
    hotelId: json["hotel"],
    productGroupId: json["id"],
    description: json["descricao"],
    display: json["exibir"],
    code: json["codigo"] == null ? null : json["codigo"],
  );

  Map<String, dynamic> toJson() => {
    "hotel": hotelId,
    "id": productGroupId,
    "descricao": description,
    "exibir": display,
    "codigo": code == null ? null : code,
  };

  @override
  String toString() {
    return 'ProductGroup{identifier: $identifier, hotelId: $hotelId, productGroupId: $productGroupId, description: $description, displayProduct: $display, code: $code}';
  }
}