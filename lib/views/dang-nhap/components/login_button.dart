import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/trang-san-pham/Men/MenScreen.dart';

class login_button extends StatelessWidget {
  const login_button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: MaterialButton(
        minWidth: double.maxFinite,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MenScreen()));
        },
        child: Text(
          "LOGIN",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        color: Colors.pink.shade200,
      ),
    );
  }
}
