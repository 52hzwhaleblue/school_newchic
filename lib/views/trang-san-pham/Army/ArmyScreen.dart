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
      body: Body(),
    );
  }
}
