import 'package:flutter/material.dart';

class subTitle extends StatelessWidget {
  const subTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sign in to your account",
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      ],
    );
  }
}
