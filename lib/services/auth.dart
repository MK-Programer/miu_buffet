import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signinWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    UserCredential userCredential =
        await _auth.signInWithCredential(authCredential);

    User? user = userCredential.user;

    print('user email = ${user!.email}');
  }

  Future<void> signout() async {
    try {
      await _googleSignIn.disconnect();
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
