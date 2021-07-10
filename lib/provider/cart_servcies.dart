part of 'providers.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _carts = [];

  List<Cart> get carts => _carts;

  set carts(List<Cart> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(Product product) {
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product.id == product.id);

      _carts[index].quantity++;
    } else {
      _carts.add(
        Cart(id: _carts.length, product: product, quantity: 1),
      );
    }

    notifyListeners();
  }

  productExist(Product product) {
    if (_carts.indexWhere((element) => element.product.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity++;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].quantity--;
    if (_carts[id].quantity == 0) {
      removeCart(id);
    }

    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in carts) {
      total += item.quantity;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in carts) {
      total += (item.quantity * item.product.price);
    }
    return total;
  }
}
