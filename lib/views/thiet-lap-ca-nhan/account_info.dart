import 'package:flutter/material.dart';

import 'package:onboarding_demo/views/dang-nhap/login_screen.dart';
import 'package:onboarding_demo/views/thiet-lap-ca-nhan/components/email.dart';
import 'package:onboarding_demo/views/thiet-lap-ca-nhan/components/fullname.dart';
import 'package:onboarding_demo/views/thiet-lap-ca-nhan/components/password.dart';
import 'package:onboarding_demo/views/thiet-lap-ca-nhan/components/phone.dart';
import 'package:onboarding_demo/views/thiet-lap-ca-nhan/profile_setting.dart';

class AccountInfo extends StatefulWidget {
  AccountInfo({Key key}) : super(key: key);

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  _buildTextField(IconData iconData, String title, String user_info,
      double padding, Widget screen) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            iconData,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        user_info,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: padding),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => screen,
                        ),
                      );
                    });
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileSetting(),
                  ),
                );
              });
            },
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text(
            "Thông Tin Tài Khoản",
          ),
        ),
        body: Column(
          children: [
            _buildTextField(
                Icons.person_outline, "Họ & Tên", "Minh Long", 0, Fullname()),
            _buildTextField(Icons.contact_mail_outlined, "Email",
                "@josephminhlong@gmail.com", 0, Email()),
            _buildTextField(
                Icons.phone_outlined, "Phone", "0704123459", 0, Phone()),
            _buildTextField(
                Icons.lock, "Thiết lập mật khẩu", "0704123459", 0, Password()),
          ],
        ),
      ),
    );
  }
}
