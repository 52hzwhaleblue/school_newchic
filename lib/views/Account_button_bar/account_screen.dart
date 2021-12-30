import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 50,
              height: 100,
              color: Colors.black,
            ),
            Column(
              children: [
                Container(
                  width: 50,
                  height: 100,
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
