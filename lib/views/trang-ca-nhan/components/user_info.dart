import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({
    Key key,
  }) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.transparent,
      child: new Container(
        decoration: new BoxDecoration(
          color: Colors.blue,
          borderRadius: new BorderRadius.only(
            bottomLeft: const Radius.circular(40.0),
            bottomRight: const Radius.circular(40.0),
          ),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    "Minh Long",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 80,
              ),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                    "https://scontent.fpnh22-4.fna.fbcdn.net/v/t39.30808-6/273613671_1345060255968483_458924592858524926_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=9kLzn0CzgzoAX_ix9kJ&_nc_ht=scontent.fpnh22-4.fna&oh=00_AT_pEWINGZy5mliH9lRzIDZ6Q_mxh9BUxHvPLnmrghFUYQ&oe=6219866C"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
