import 'package:miu_food_court/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:miu_food_court/services/data_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

String phone = '';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  UserData? _userFromFirebaseUser(User? user) {
    return user != null
        ? UserData(
            uid: user.uid,
            picture: user.photoURL,
            name: user.displayName,
            email: user.email,
            phoneNumber: phone,
          )
        : null;
  }

  Stream<UserData?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  setPref(String uid) async {
    try {
      // print('1 $uid');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', uid.toString());
      // print('2 ${uid.toString()}');
    } catch (e) {
      print('err ${e.toString()}');
    }
  }

  getPref() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('uid');
    } catch (e) {
      print('err ${e.toString()}');
    }
  }

  Future signinWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      UserCredential? userCredential =
          await _auth.signInWithCredential(authCredential);

      User? user = userCredential.user;
      await setPref(user!.uid);
      if (!user.email!.contains("@miuegypt.edu.eg")) return false;
      DatabaseService db = DatabaseService(uid: user.uid);
      phone = await db.getPhone();
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signout() async {
    try {
      print('signed out');
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signin({required String email, required String password}) async {
    try {
      UserCredential? userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      await setPref(user!.uid);
      return true;
    } on FirebaseAuthException catch (e) {
      print('err ${e.toString()}');
      return false;
    }
  }

  Future<bool> addOffice(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print('err ${e.toString()}');
      return false;
    }
  }
}
