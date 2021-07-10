part of 'services.dart';

class MessageServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Stream<List<Message>> getMessageByUserId({required int userId}) {
  //   try {
  //     return firestore
  //         .collection('messages')
  //         .where('userId', isEqualTo: userId)
  //         .snapshots()
  //         .map(
  //       (query) {
  //         var result = query.docs.map<Message>((message) {
  //           print('event message: ${message.data()}');
  //           print('evet berhasil');
  //           return Message.fromJson(message.data());
  //         }).toList();
  //         print('result berhasil');
  //         print(result);

  //         result.sort(
  //             (Message a, Message b) => a.createdAt.compareTo(b.createdAt));

  //         print('result: ${result}');

  //         return result;
  //       },
  //     );
  //   } catch (e) {
  //     throw Exception('problem: ${e}');
  //   }
  // }

  Stream<List<Message>> getMessagesByUserId({required int userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((list) {
        var result = list.docs.map<Message>((message) {
          print(message.data());
          return Message.fromJson(message.data());
        }).toList();

        result.sort(
          (Message a, Message b) => a.createdAt.compareTo(b.createdAt),
        );

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage({
    required User user,
    required bool isFromUser,
    required String message,
    required Product product,
  }) async {
    try {
      firestore.collection('messages').add({
        'userId': user.id,
        'userName': user.name,
        'userImage': user.profilePhotoUrl,
        'isFromUser': isFromUser,
        'message': message,
        'product': product is UninitializedProduct ? {} : product.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then((value) => 'Pesan berhasil di kirim!');
    } catch (e) {
      print('problem : ${e}');
      print('Gagal mengirim pesan');
    }
  }
}
