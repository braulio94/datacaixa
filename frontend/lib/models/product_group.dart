import 'package:datacaixa/common/contants.dart' as c;

class ProductGroup {
  int identifier;
  int hotelId;
  int productGroupId;
  String description;
  String displayProduct;
  int code;
  String printer1;
  String printer2;

  ProductGroup();

  ProductGroup.add(this.hotelId, this.productGroupId, this.description,
      this.displayProduct, this.code);

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

  @override
  String toString() {
    return 'ProductGroup{identifier: $identifier, hotelId: $hotelId, productGroupId: $productGroupId, description: $description, displayProduct: $displayProduct, code: $code}';
  }
}