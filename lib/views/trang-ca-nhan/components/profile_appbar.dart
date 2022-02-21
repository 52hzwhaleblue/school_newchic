import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:onboarding_demo/views/thiet-lap-ca-nhan/profile_setting.dart';

class ProfileAppBar extends StatefulWidget with PreferredSizeWidget {
  const ProfileAppBar({
    Key key,
  }) : super(key: key);

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text("Cá nhân"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileSetting(),
                ));
          },
          icon: Icon(
            Icons.settings_outlined,
          ),
        ),
        Badge(
          badgeColor: Colors.yellow.shade900,
          position: BadgePosition.topEnd(
            top: 0,
            end: 0,
          ),
          badgeContent: Text(
            '9',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          child: IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 32,
            ),
            onPressed: () {
              // setState(() {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => CartScreen(),
              //     ),
              //   );
              // });
            },
          ),
        ),
      ],
    );
  }
}
