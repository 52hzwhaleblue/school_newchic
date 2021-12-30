import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/trang-san-pham/Army/components/body.dart';

class ArmyScreen extends StatefulWidget {
  ArmyScreen({Key key}) : super(key: key);

  @override
  _ArmyScreenState createState() => _ArmyScreenState();
}

class _ArmyScreenState extends State<ArmyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: Body(),
    );
  }

  AppBar header() {
    return AppBar(
      // backgroundColor: Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Coolmate",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
