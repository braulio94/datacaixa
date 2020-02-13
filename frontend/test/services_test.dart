import 'dart:convert';

import 'package:datacaixa/models/product.dart';
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
    Response response = await productService.getProduct(408);
    Product product = Product.fromJson(json.decode(response.body)['produto']);
    expect('SAGRES PRETA LATA', product.description);
  });
}