import 'dart:convert';

import 'package:datacaixa/common/api_routes.dart';
import 'package:datacaixa/models/product.dart';
import 'package:datacaixa/models/product_group.dart';
import 'package:datacaixa/services/base_service.dart';
import 'package:http/http.dart';

class ProductService extends BaseService {

  getProduct(int id) async {
    Response response = await client.get(BASE_URL + PRODUCT + '/$id') ;
    return Product.fromJson(json.decode(response.body)['produto']);
  }

  getProductsByGroup(int groupId, int page, order) async {
    var uri = Uri.http(HOST, PRODUCTS + '/$groupId', {PAGE: '$page', ORDERBY: order});
    Response response = await client.get(uri);
    return List<Product>.from(json.decode(response.body)["produtos"].map((x) => Product.fromJson(x)));
  }

  getProducts(int page, order) async {
    var uri = Uri.http(HOST, PRODUCTS, {PAGE: '$page', ORDERBY: order});
    Response response = await client.get(uri);
    return List<Product>.from(json.decode(response.body)["produtos"].map((x) => Product.fromJson(x)));
  }

  searchProducts(String description) async {
    Response response = await client.get(BASE_URL + PRODUCTS + SEARCH + '/$description');
    return List<Product>.from(json.decode(response.body)["produtos"].map((x) => Product.fromJson(x)));
  }

  getProductGroups() async {
    Response response = await client.get(BASE_URL + PRODUCT_GROUP);
    return List<ProductGroup>.from(json.decode(response.body)["grupo_produtos"].map((x) => ProductGroup.fromJson(x)));
  }
}