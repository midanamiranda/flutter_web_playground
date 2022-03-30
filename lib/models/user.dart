import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const UID = "uid";
  static const EMAIL = "email";
  static const NAME = "name";
  static const PHOTO = "photo";

  late String _uid;
  late String _email;
  late String _name;
  late String _photo;

  String get uid => _uid;
  String get email => _email;
  String get name => _name;
  String get photo => _photo;

  UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    _name = snapshot.data()![NAME];
    _photo = snapshot.data()![PHOTO];
    _uid = snapshot.data()![UID];
    _email = snapshot.data()![EMAIL];
  }
}