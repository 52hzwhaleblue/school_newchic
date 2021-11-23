library login.dart;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  //const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    suffixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: pwdController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    suffixIcon: Icon(Icons.password),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    login();
                  },
                  icon: const Icon(Icons.login),
                  label: const Text("Login"),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.app_registration),
                  label: const Text("Register"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // CREATE FUNCTION TO CALL LOGIN API
  Future<void> login() async {
    if (emailController.text.isNotEmpty && pwdController.text.isNotEmpty) {
      var response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: ({
            'email': emailController.text,
            'password': pwdController.text
          }));

      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Welcome()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Invalid Credentials"),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Black Field not Allowed"),
      ));
    }
  }
}
