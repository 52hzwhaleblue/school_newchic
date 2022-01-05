library get_started.dart;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/dang-nhap/login_screen.dart';

import 'package:onboarding_demo/views/dang-ky/register.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/get-started/lisa.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.white.withOpacity(0.7),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: const BorderSide(
                              color: Color.fromRGBO(171, 6, 174, 0.9),
                              width: 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        child: Container(
                          width: 100,
                          height: 45,
                          alignment: Alignment.center,
                          child: const Text(
                            'LOG IN',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(171, 6, 174, 0.9)),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RegisterScreen())); // navigate
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(171, 6, 174, 0.9),
                        side: const BorderSide(
                            color: Color.fromRGBO(171, 6, 174, 0.9), width: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Container(
                        width: 100,
                        height: 45,
                        alignment: Alignment.center,
                        child: const Text(
                          'REGISTER',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
