import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/xac-nhan-gio-hang/components/app-bar.dart';
import 'package:onboarding_demo/views/xac-nhan-gio-hang/components/bottom_nav_cart.dart';

class ConfirmCart extends StatefulWidget {
  ConfirmCart({Key key}) : super(key: key);

  @override
  State<ConfirmCart> createState() => _ConfirmCartState();
}

class _ConfirmCartState extends State<ConfirmCart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: Header(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.place,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  Text(
                    "Nguyễn Vũ Minh Long",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      "|",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  Text(
                    "0699129879",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                      width: size.width * 85 / 100,
                      height: 100,
                      color: Colors.orange,
                      child: Text("Địa chỉ ..........."),
                    ),
                    Container(
                      width: size.width * 10 / 100,
                      height: 100,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  height: 300,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple.shade100,
                  ),
                  child: Container(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Colors.red,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Container(
                          width: 250,
                          height: 80,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Bottom_Nav_Cart(),
      ),
    );
  }
}
