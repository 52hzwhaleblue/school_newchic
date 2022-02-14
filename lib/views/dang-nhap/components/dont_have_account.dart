import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/dang-ky/register.dart';

class dont_have_account extends StatefulWidget {
  const dont_have_account({
    Key key,
  }) : super(key: key);

  @override
  State<dont_have_account> createState() => _dont_have_accountState();
}

class _dont_have_accountState extends State<dont_have_account> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: new Text(
            "Don't have an account?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RegisterScreen()));
            });
          },
          child: Text(
            " Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ],

    );
  }
}
