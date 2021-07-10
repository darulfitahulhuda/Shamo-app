part of 'model.dart';

class CategoryProduct {
  final int id;
  final String name;

  CategoryProduct({required this.id, required this.name});

  factory CategoryProduct.fromJson(Map<String, dynamic> json) =>
      CategoryProduct(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
