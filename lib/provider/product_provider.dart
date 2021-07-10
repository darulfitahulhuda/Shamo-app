part of 'providers.dart';

class ProductProvider with ChangeNotifier {
  late List<Product> _product;
  List<Product> get product => _product;

  set product(List<Product> product) {
    _product = product;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<Product>? product = await ProductServices().getProducts();

      print(product);
      _product = product!;
    } catch (e) {
      print('problem: ' + e.toString());
    }
  }
}
