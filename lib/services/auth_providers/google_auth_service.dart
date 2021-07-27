
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final googleSignIn = GoogleSignIn();

  Future<String?> login() async {
    // make sure to log out user otherwise it will login using the previous account
    await _signOut();

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final loggedInUser = await FirebaseAuth.instance.signInWithCredential(credential);
    final token = await loggedInUser.user!.getIdToken();
    return token;
  }

  Future _signOut() async {
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
