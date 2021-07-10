part of 'services.dart';

class TransactionServices {
  Future<bool> checkout(
      String token, List<Cart> carts, double, totalPrice) async {
    var url = baseUrl + 'checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'address': 'Marsemoon',
      'items': carts
          .map((e) => {
                'id': e.product.id,
                'quantity': e.quantity,
              })
          .toList(),
      'status': "PENDING",
      'total_price': totalPrice,
      'shipping_price': 0
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout');
    }
  }
}
