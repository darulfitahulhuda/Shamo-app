part of 'model.dart';

class GalleryProduct {
  int id;
  String url;

  GalleryProduct({required this.id, required this.url});

  factory GalleryProduct.fromJson(Map<String, dynamic> json) => GalleryProduct(
        id: json['id'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
      };
}
