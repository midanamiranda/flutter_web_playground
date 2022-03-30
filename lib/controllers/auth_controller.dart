import 'package:complete_web_course/constants/constants.dart';
import 'package:complete_web_course/models/user.dart';
import 'package:complete_web_course/routing/routes.dart';
import 'package:complete_web_course/services/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  User? _user;
  final UserServices _userServices = UserServices();

  UserModel? _userModel;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // getter
  UserModel? get userModel => _userModel;
  User get user => _user!;

  setup() {
    _fireSetup();
  }

  _fireSetup() async {
    await initialization.then((value) {
      auth.authStateChanges().listen((_onStateChanged));
    });
  }

  Future<Map<String, dynamic>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );
      await auth.signInWithCredential(credential).then((userCredentials) async {
        _user = userCredentials.user!;
        var prefs = await SharedPreferences.getInstance();
        await prefs.setString("id", _user!.email!);
        if (!await _userServices.doesUserExist(_user!.email!)) {
          await _userServices.createUser(_user!.uid, _user!.displayName!, _user!.photoURL!, _user!.email!);
          await initializeUserModel();
          // return {"success": false, "message": "Utilizador não registado, favor entrar em contato com o administrador de sistema."};
        } else {
          await initializeUserModel();
        }
      });
      return {"success": true, "message": "success"};
    } catch (e) {
      update();
      return {"success": false, "message": e.toString()};
    }
  }

  initializeUserModel() async {
    var preferences = await SharedPreferences.getInstance();
    var _userId = preferences.getString('id')!;
    _userModel = await _userServices.getUserById(_userId);
  }

  signOut() {
    auth.signOut();
    _userModel = null;
  }

  _onStateChanged(User? firebaseUser) async {
    _user = firebaseUser;
    if (null == _user) {
      _userModel = null;
    } else {
      await initializeUserModel();
    }
  }
}