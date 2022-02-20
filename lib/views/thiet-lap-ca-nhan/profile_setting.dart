import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/dia-chi/user-address.dart';

import 'package:onboarding_demo/views/thiet-lap-ca-nhan/account_info.dart';

class ProfileSetting extends StatefulWidget {
  ProfileSetting({Key key}) : super(key: key);

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text("Thiết Lập Cá Nhân"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountInfo(),
                      ),
                    );
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Thông Tin Tài Khoản",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AccountInfo(),
                            ),
                          );
                        });
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sổ địa chỉ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserAddress(),
                          ),
                        );
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            bottom: 10,
          ),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child: Text(
                "Đăng xuất",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
