import 'package:complete_web_course/constants/constants.dart';
import 'package:complete_web_course/models/user.dart';

class UserServices {
  String collection = "users";

  createUser(
    String id,
    String name,
    String photo,
    String email,
  ) async {
    await firebaseFirestore.collection(collection).doc(email).set({
      "name": name,
      "uid": id,
      "photo": photo,
      "email": email
    });
  }

  Future<UserModel> getUserById(String email) async =>
      firebaseFirestore.collection(collection).doc(email).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });

  Future<bool> doesUserExist(String email) async => firebaseFirestore
      .collection(collection)
      .doc(email)
      .get()
      .then((value) => value.exists);

  Future<List<UserModel>> getAll() async =>
      firebaseFirestore.collection(collection).get().then((result) {
        List<UserModel> users = [];
        for (var user in result.docs) {
          users.add(UserModel.fromSnapshot(user));
        }
        return users;
      });
}