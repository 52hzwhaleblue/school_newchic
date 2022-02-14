import 'package:flutter/material.dart';

class background extends StatelessWidget {
  const background({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        "assets/login/login.jpg",
        fit: BoxFit.cover,
        color: Colors.black38,
        colorBlendMode: BlendMode.darken,
      ),
    );
  }
}
