library welcome.dart;

import 'package:flutter/material.dart';
import 'login.dart';

class Welcome extends StatefulWidget {
  //const welcome({Key? key}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Welcome User"),
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
