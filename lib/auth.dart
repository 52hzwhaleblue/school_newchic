import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
GoogleSignIn googleSignIn = GoogleSignIn();
_signInWithGoogle() async {
  final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  final GoogleSignInAuthentication googlAuth = await googleUser.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googlAuth.idToken, accessToken: googlAuth.accessToken);
  final User user = (await firebaseAuth.signInWithCredential(credential)).user;
}
