import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class google_facebook_logo extends StatefulWidget {
  google_facebook_logo({Key key}) : super(key: key);

  @override
  _google_facebookState createState() => _google_facebookState();
}

class _google_facebookState extends State<google_facebook_logo> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  // _signInWithGoogle();
                });
              },
              icon: Image.asset("assets/logo/google.png"),
            ),
            Text(
              "Google",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            Container(
              width: 40,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  print("logo fb");
                });
              },
              icon: Image.asset("assets/logo/facebook.png"),
            ),
            Text(
              "Facebook",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googlAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googlAuth.idToken, accessToken: googlAuth.accessToken);
    final User user =
        (await firebaseAuth.signInWithCredential(credential)).user;
  }
}
