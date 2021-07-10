part of 'model.dart';

class User {
  final int id;
  final String? name;
  final String? email;
  final String? username;
  final String? profilePhotoUrl;
  String? token;

  // int id;
  // String name;
  // String email;
  // String username;
  // String profilePhotoUrl;
  // String token;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.username,
      required this.profilePhotoUrl,
      required this.token});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      profilePhotoUrl: json['profile_photo_url'],
      token: json['token']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'profile_photo_url': profilePhotoUrl,
      'token': token
    };
  }

  // @override
  // List<Object?> get props =>
  //     [id, name, email, username, profilePhotoUrl, token];
}
