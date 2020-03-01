import 'package:async/async.dart';
import 'package:datacaixa/models/product.dart';
import 'package:datacaixa/models/product_group.dart';
import 'package:datacaixa/repository/products_repository.dart';
import 'package:mobx/mobx.dart';
part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  ProductsRepository repository = ProductsRepository();
  AsyncMemoizer<List<Product>> _productsMemoizer = AsyncMemoizer<List<Product>>();
  final _groupsMemoizer = AsyncMemoizer<List<ProductGroup>>();

  @observable
  List<ProductGroup> groups = [];
  @observable
  List<Product> products = [];
  @observable
  int page = 1;
  @observable
  int group;
  @observable
  bool showProducts = false;

  @action
  Product selected(index) => products[index];

  @action
  selectGroup(int index) => group = index;

  @action
  incrementPage() async {
    page++;
    products = await repository.loadProducts(group, page);
  }

  decrementPage() async {
    if (page > 1) {
      page--;
    }
    products = await repository.loadProducts(group, page);
  }

  @action
  resetPage() => page = 1;

  @action
  changeDisplay() => showProducts = !showProducts;

  @action
  restartMemorizer(){
    _productsMemoizer = AsyncMemoizer<List<Product>>();
  }

  @action
  Future<List<Product>> getProducts() async => this._productsMemoizer.runOnce(() async => products = await repository.loadProducts(group, page));

  @action
  Future<List<ProductGroup>> getGroups() async => this._groupsMemoizer.runOnce(() async => groups = await repository.loadProductGroups());
}