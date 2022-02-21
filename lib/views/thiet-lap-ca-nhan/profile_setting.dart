import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/user-api.dart';
import 'package:onboarding_demo/views/constants.dart';
import 'package:onboarding_demo/views/dang-nhap/constants.dart';
import 'package:onboarding_demo/views/dia-chi/user-address.dart';

import 'package:onboarding_demo/views/thiet-lap-ca-nhan/account_info.dart';
import 'package:onboarding_demo/network/getUserID_request.dart';

class ProfileSetting extends StatefulWidget {
  ProfileSetting({Key key}) : super(key: key);

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  List<User> usersData = [];

  @override
  void initState() {
    super.initState();
    //get & fetch userID

    getUserID.fetchUserID().then((dataFromServe) {
      setState(() {
        usersData = dataFromServe;
      });
    });
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
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text("Thiết Lập Cá Nhân"),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: usersData.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber,
              child: Row(
                children: [
                  Text("Sổ địa chỉ"),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        userID = usersData[index].id;
                        print(userID);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserAddress(),
                            ));
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ],
              ),
            );
          },
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
