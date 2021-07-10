part of 'providers.dart';

class WishlistProvider with ChangeNotifier {
  List<Product> _wishlist = [];
  List<Product> get wishlist => _wishlist;

  set product(List<Product> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setProduct(Product product) {
    if (!isWishlist(product)) {
      _wishlist.add(product);
    } else {
      _wishlist.removeWhere((element) => element.id == product.id);
    }
    notifyListeners();
  }

  isWishlist(Product product) {
    if (_wishlist.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
