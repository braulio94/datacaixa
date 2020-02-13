import 'package:datacaixa/common/contants.dart' as c;

class Product {
  int identifier;
  int hotelId;
  int productId;
  int userId;
  int productGroupId;
  int cfopId;
  String code;
  String description;
  String comment;
  double minStock;
  double maxStock;
  double stock;
  String createdAt;
  double cost;
  double price;
  double profitMargin;
  String isActive;
  String stockWatch;
  double buyings;
  double sales;
  double consumption;
  String unit;
  double outlet;
  String icmsEcf;
  double tax;
  double federalTax;
  double stateTax;
  double municipalTax;
  double taxSource;
  int preparingTime;
  String discrete;
  double serviceTax;
  String alcohol;
  String spotlight;

  Product();

  Product.add({this.productId, this.productGroupId, this.description, this.createdAt,
      this.price, this.sales});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      c.productId: productId,
      c.productGroupId: productGroupId,
      c.description: description,
      c.createdAt: createdAt,
      c.price: price,
      c.sales: sales,
    };
    if(identifier != null){
      map[c.identifier] = identifier;
    }
    return map;
  }

  Product.fromMap(Map<String, dynamic> map){
    identifier = map[c.identifier];
    productId = map[c.productId];
    productGroupId = map[c.productGroupId];
    description = map[c.description];
    createdAt = map[c.createdAt];
    price = map[c.price];
    sales = map[c.sales];
  }

  factory Product.fromJson(Map<String, dynamic> json) => Product.add(
    productId: json["id"],
    productGroupId: json["grupo"],
    description: json["descricao"],
    createdAt: json["data_cadastro"],
    price: json["preco"].toDouble(),
    sales: json["total_vendas"] == null ? null : json["total_vendas"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": productId,
    "grupo": productGroupId,
    "descricao": description,
    "data_cadastro": createdAt,
    "preco": price,
    "total_vendas": sales == null ? null : sales,
  };

  @override
  String toString() {
    return 'Product{identifier: $identifier, productId: $productId, productGroupId: $productGroupId, description: $description, createdAt: $createdAt, price: $price, sales: $sales}';
  }
}