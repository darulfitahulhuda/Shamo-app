part of 'providers.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
      String token, List<Cart> carts, double totalPrice) async {
    try {
      if (await TransactionServices()
          .checkout(token, carts, double, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
