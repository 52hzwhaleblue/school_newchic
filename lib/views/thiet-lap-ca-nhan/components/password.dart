import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/thiet-lap-ca-nhan/account_info.dart';

class Password extends StatefulWidget {
  Password({Key key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController PasswordConfirmController =
      TextEditingController();

  bool eye1 = true;
  bool eye2 = false;

  _buildTextFiled(String hintText, bool obscureText,
      TextEditingController controller, IconData icon) {
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
              suffixIcon: IconButton(
                color: Colors.black,
                icon: eye1 ? Icon(icon) : Icon(Icons.visibility_off),
                onPressed: () {
                  eye1 = !eye1;
                },
              ),
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  _buildPasswordConfirm(String hintText, bool obscureText,
      TextEditingController controller, IconData icon) {
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
              suffixIcon: IconButton(
                color: Colors.black,
                icon: eye2 ? Icon(icon) : Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    eye2 != eye2;
                  });
                },
              ),
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
            "Mật khẩu",
          ),
        ),
        body: Container(
          height: 300,
          width: size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: Text(
                  "Mật khẩu",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              _buildTextFiled(
                  "Nhập mật khẩu", false, PasswordController, Icons.visibility),
              Container(
                height: 50,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Text(
                      "Mật khẩu mới phải có ít nhất 8 - 32 ký tự, phải bao gồm chữ và số",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              _buildPasswordConfirm("Nhập lại mật khẩu", false,
                  PasswordConfirmController, Icons.visibility),
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
