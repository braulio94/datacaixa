import 'dart:convert';

import 'package:datacaixa/common/api_routes.dart';
import 'package:datacaixa/models/product.dart';
import 'package:datacaixa/models/product_group.dart';
import 'package:datacaixa/services/base_service.dart';
import 'package:http/http.dart';

class ProductService extends BaseService {

  getProduct(int id) async {
    Response response = await client.get(BASE_URL + PRODUCT + '/$id');
    return Product.fromJson(json.decode(response.body)['produto']);
  }

  getProductsByGroup(int id) async {
    Response response = await client.get(BASE_URL + PRODUCT_GROUP + '/$id');
    return ProductGroup.fromJson(json.decode(response.body)['produto']);
  }

  getProductsInOrder(){

  }

  searchProducts(){

  }

  getProductGroups(){

  }
}