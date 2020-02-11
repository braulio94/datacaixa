import 'package:datacaixa/common/contants.dart' as c;
import 'package:datacaixa/models/product.dart';

class ProductGroup {
  int identifier;
  int hotelId;
  int productGroupId;
  String description;
  String displayProduct;
  int code;
  String printer1;
  String printer2;
  List<Product> products;

  ProductGroup();

  ProductGroup.add({this.hotelId, this.productGroupId, this.description,
      this.displayProduct, this.code, this.products});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      c.hotelId: hotelId,
      c.productGroupId: productGroupId,
      c.description: description,
      c.display: displayProduct,
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
    displayProduct = map[c.display];
    code = map[c.display];
  }

  factory ProductGroup.fromJson(Map<String, dynamic> json) => ProductGroup.add(
    products: List<Product>.from(json["produtos"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "produtos": List<dynamic>.from(products.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'ProductGroup{identifier: $identifier, hotelId: $hotelId, productGroupId: $productGroupId, description: $description, displayProduct: $displayProduct, code: $code}';
  }
}