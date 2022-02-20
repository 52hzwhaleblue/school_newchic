import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/thiet-lap-ca-nhan/account_info.dart';

class Phone extends StatefulWidget {
  Phone({Key key}) : super(key: key);

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  final TextEditingController PhoneController = TextEditingController();

  _buildTextFiled(
      String hintText, bool obscureText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          border: new Border.all(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: new TextField(
            obscureText: obscureText,
            textAlign: TextAlign.left,
            decoration: new InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      theme: new ThemeData(
        scaffoldBackgroundColor: Colors.indigo[50],
      ),
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
                    builder: (context) => AccountInfo(),
                  ),
                );
              });
            },
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text(
            "Số điện thoại",
          ),
        ),
        body: Container(
          height: 230,
          width: size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: Text(
                  "Số điện thoại",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              _buildTextFiled("Nhập Số điện thoại", false, PhoneController),
              Container(
                height: 50,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Text(
                      "Mã xác thực (OTP) sẽ được gửi đến số điện thoại này để xác minh số điện thoại là của bạn",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60, top: 10),
                child: Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 110, top: 10),
                    child: Text(
                      "Lưu thay đổi",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
