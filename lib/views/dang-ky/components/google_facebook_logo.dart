import 'package:flutter/material.dart';

class google_facebook_logo extends StatefulWidget {
  google_facebook_logo({Key key}) : super(key: key);

  @override
  _google_facebookState createState() => _google_facebookState();
}

class _google_facebookState extends State<google_facebook_logo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
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
}
