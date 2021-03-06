import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:onboarding_demo/views/gio-hang/cart_screen.dart';

class AddAddress extends StatefulWidget {
  AddAddress({Key key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final TextEditingController reciverController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController wardController = TextEditingController();

  _buildTextFiled(String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          border: new Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: new TextField(
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
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        scaffoldBackgroundColor: Colors.indigo[50],
      ),
      home: Scaffold(
        appBar: AppBar(
          actions: [
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
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ),
                    );
                  });
                },
              ),
            ),
          ],
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              });
            },
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text("?????a ch??? nh???n h??ng"),
        ),
        body: Column(
          children: [
            _buildTextFiled("Nh???p h??? & t??n ng?????i nh???n", reciverController),
            _buildTextFiled("Nh???p s??? ??i???n tho???i", phoneController),
            _buildTextFiled("Nh???p ?????a ch??? nh??", addressController),
            _buildTextFiled("Nh???p th??nh ph???", cityController),
            _buildTextFiled("Nh???p qu???n/huy???n", districtController),
            _buildTextFiled("Nh???p ph?????ng/x??", wardController),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              bottom: 10,
            ),
            child: Container(
              width: 60,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(7),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  "Th??m ?????a ch??? m???i",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
