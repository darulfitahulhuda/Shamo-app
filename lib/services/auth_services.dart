part of 'services.dart';

class AuthServices {
  Future<User> register({
    required String name,
    required String email,
    required String username,
    required String password,
  }) async {
    var url = baseUrl + 'register';
    var header = {"Content-Type": "application/json"};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(Uri.parse(url), headers: header, body: body);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      User user = User.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<User> login({required String email, required String password}) async {
    var url = baseUrl + 'login';
    var header = {
      "Content-Type": "application/json",
    };
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      User user = User.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
