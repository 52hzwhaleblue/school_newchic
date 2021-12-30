library welcome.dart;

import 'package:flutter/material.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  //const welcome({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Register"),
              const SizedBox(
                height: 50,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.exit_to_app, size: 18),
                label: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
