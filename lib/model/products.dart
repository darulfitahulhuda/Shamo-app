part of 'model.dart';

class Product {
  // final int id;
  // final String name;
  // final double price;
  // final String description;
  // final String? tags;
  // late final CategoryProduct category;
  // late final List<GalleryProduct> galleries;
  // final DateTime createdAt;
  // final DateTime updatedAt;
  int id;
  String name;
  double price;
  String description;
  String? tags;
  CategoryProduct category;
  late List<GalleryProduct> galleries;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    this.tags,
    required this.category,
    required this.galleries,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        price: double.parse(json['price'].toString()),
        description: json['description'],
        tags: json['tags'],
        category: CategoryProduct.fromJson(json['category']),
        galleries: json['galleries']
            .map<GalleryProduct>((gallery) => GalleryProduct.fromJson(gallery))
            .toList(),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'tags': tags,
        'category': category.toJson(),
        'galleries': galleries.map((e) => e.toJson()).toList(),
        'created_at': createdAt.toString(),
        'updated_at': updatedAt.toString(),
      };
}

class UninitializedProduct extends Product {
  UninitializedProduct()
      : super(
          id: 1,
          name: '',
          price: 123,
          category: CategoryProduct(id: 1, name: ''),
          description: '',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          galleries: [],
        );

  // UninitializedProduct({Product? product})
  //     : super(
  //         id: product!.id,
  //         name: product.name,
  //         price: product.price,
  //         description: product.description,
  //         category: product.category,
  //         galleries: product.galleries,
  //         createdAt: product.createdAt,
  //         updatedAt: product.updatedAt,
  //       );
}
