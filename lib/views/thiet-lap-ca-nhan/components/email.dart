import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/thiet-lap-ca-nhan/account_info.dart';

class Email extends StatefulWidget {
  Email({Key key}) : super(key: key);

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final TextEditingController emailController = TextEditingController();

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
            "Địa chỉ e-mail",
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
                  "Địa chỉ e-mail",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              _buildTextFiled("Nhập Địa chỉ e-mail", false, emailController),
              Container(
                height: 50,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Text(
                      "Mã xác thực (OTP) sẽ được gửi đến email này để xác minh emal là của bạn",
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
