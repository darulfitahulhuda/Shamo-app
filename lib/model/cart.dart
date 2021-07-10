part of 'model.dart';

class Cart {
  final int id;
  final Product product;
  int quantity;

  Cart({
    required this.id,
    required this.product,
    required this.quantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json['id'],
        product: Product.fromJson(json['product']),
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product.toJson(),
        'quantity': quantity,
      };

  double getTotalPrice() {
    return product.price * quantity;
  }
}
