part of 'providers.dart';

class AuthProvider with ChangeNotifier {
  late User _user;
  User get user => _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      User user = await AuthServices().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      print('auth provider register  benar');

      _user = user;
      return true;
    } catch (e) {
      print('auth provider register slaah');
      print(e);
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      User user = await AuthServices().login(
        email: email,
        password: password,
      );
      print(user.name);
      print('auth provider login benar');

      _user = user;
      return true;
    } catch (e) {
      print('auth provider login salah');
      print(e);
      return false;
    }
  }

  // Future<bool> signIn({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     var user = AuthServices().signIn(
  //       email: email,
  //       password: password,
  //     );
  //     _user = user;

  //     return true;
  //   } catch (e) {}
  // }
}
