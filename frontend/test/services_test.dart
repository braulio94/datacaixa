import 'dart:convert';

import 'package:datacaixa/common/api_routes.dart';
import 'package:datacaixa/models/product.dart';
import 'package:datacaixa/models/product_group.dart';
import 'package:datacaixa/services/product_service.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

void main(){
  test('Product test', () async {

    ProductService productService = ProductService();
    Response response = await productService.getProduct(408);
    Product product = Product.fromJson(json.decode(response.body)['produto']);
    expect('SAGRES PRETA LATA', product.description);
  });

  test('Product Group test', () async {

    ProductService productService = ProductService();
    Response response = await productService.client.get(BASE_URL + PRODUCT_GROUP);
    List<ProductGroup> groups = List<ProductGroup>.from(json.decode(response.body)["grupo_produtos"].map((x) => ProductGroup.fromJson(x)));
    expect('HOSPEDAGENS', groups.first.description);
  });

  test('Products By Group test', () async {
    ProductService productService = ProductService();
    List<Product> products = await productService.getProductsByGroup(19, 1, 'sales');
    expect('SUPERBOCK 33CL', products.first.description);
  });

  test('Search Products test', () async {
    ProductService productService = ProductService();
    List<Product> products = await productService.searchProducts('PREGO');
    expect('PREGO NO PRATO PD', products.first.description);
  });
}