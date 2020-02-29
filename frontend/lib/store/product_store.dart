import 'package:datacaixa/models/product.dart';
import 'package:datacaixa/models/product_group.dart';
import 'package:datacaixa/repository/products_repository.dart';
import 'package:mobx/mobx.dart';
part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  ProductsRepository repository = ProductsRepository();
  @observable
  List<ProductGroup> groups = [];
  @observable
  List<Product> products = [];
  @observable
  int page = 1;
  int group;

  @action
  Product selected(index) => products[index];

  @action
  selectGroup(index) => group = index;

  @action
  Future<List<Product>> getProducts() async => products = await repository.loadProducts(group, page);

  @action
  Future<List<ProductGroup>> getGroups() async => groups = await repository.loadProductGroups();
}