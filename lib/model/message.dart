part of 'model.dart';

class Message {
  // String message;
  // final User user;
  // bool isFromUser;
  // final Product product;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  // Message(
  //     {required this.message,
  //     required this.user,
  //     this.isFromUser = false,
  //     required this.product,
  //     required this.createdAt,
  //     required this.updatedAt,});

  // factory Message.fromJson(Map<String, dynamic> json) => Message(
  //     message: json['message'],
  //     user: User.fromJson(json['user']),
  //     isFromUser: json['isFromUser'],
  //     product: json['product'].isEmpty
  //         ? UninitializedProduct()
  //         : Product.fromJson(json['product']),
  //     createdAt: DateTime.parse(json['createdAt']),
  //     updatedAt: DateTime.parse(json['updatedAt']));

  // Map<String, dynamic> toJson() => {
  //       'message': message,
  //       'user': user.toJson(),
  //       'isFromUser': isFromUser,
  //       'product': product is UninitializedProduct ? {} : product.toJson(),
  //       'createdAt': createdAt.toString(),
  //       'updatedAt': updatedAt.toString(),
  //     };

  String message;
  int userId;
  String userName;
  String userImage;
  bool isFromUser;
  Product product;
  DateTime createdAt;
  DateTime updatedAt;

  Message({
    required this.message,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.isFromUser,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: json['message'],
        userId: json['userId'],
        userName: json['userName'],
        userImage: json['userImage'],
        isFromUser: json['isFromUser'],
        product: json['product'].isEmpty
            ? UninitializedProduct()
            : Product.fromJson(json['product']),
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'isFromUser': isFromUser,
      'product': product is UninitializedProduct ? {} : product.toJson(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
