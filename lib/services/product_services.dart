part of 'services.dart';

class ProductServices {
  // Future<List<Product>> getProducts() async {
  //   String url = baseUrl + 'products';

  //   var header = {"Content-Type": "application/json"};
  //   var response = await http.get(Uri.parse(url), headers: header);
  //   print(response.statusCode);
  //   // print(response.body);

  //   if (response.statusCode == 200) {
  //     //  cara 1
  //     // var data = jsonDecode(response.body);
  //     // print(data);
  //     // var products = (data['data']['data'] as Iterable)
  //     //     .map((e) => Product.fromJson(e))
  //     //     .toList();

  //     // cara 2
  //     List data = jsonDecode(response.body)['data']['data'];
  //     print(data);

  //     List<Product> products = [];
  //     print('object: ${products}');
  //     for (var item in data) {
  //       products.add(Product.fromJson(item));
  //     }
  //     print('berhasil');
  //     return products;
  //   } else {
  //     return throw Exception('Gagal mengambil data product services');
  //   }
  // }

  Future<List<Product>?> getProducts() async {
    var url = baseUrl + 'products';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];

      List<Product> products = [];

      for (var item in data) {
        products.add(Product.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}

// Product(
//     id: 50,
//     name: 'ads',
//     price: 123,
//     description: 'asdafas ',
//     tags: 'running',
//     category: CategoryProduct(id: 1, name: 'ads'),
//     galleries: [
//       GalleryProduct(id: 3, url: 'asdasd'),
//     ],
//     createdAt: DateTime.now(),
//     updatedAt: DateTime.now()),
