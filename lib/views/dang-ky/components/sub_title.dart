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
          "Sign up to dress up",
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      ],
    );
  }
}
