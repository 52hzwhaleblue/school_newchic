import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:onboarding_demo/models/address-api.dart';
import 'package:onboarding_demo/network/address_request.dart';
import 'package:onboarding_demo/views/dia-chi/add-address.dart';
import 'package:onboarding_demo/views/gio-hang/cart_screen.dart';

class UserAddress extends StatefulWidget {
  UserAddress({Key key}) : super(key: key);

  @override
  State<UserAddress> createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {
  List<Address> addressData;
  @override
  void initState() {
    super.initState();
    // lấy danh sách address với userID

    AddressRequest.fetchAddress().then((dataFromServe) {
      setState(() {
        addressData = dataFromServe;
      });
    });
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
          title: Text("Sổ địa chỉ"),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: addressData.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text("${addressData[index].reciver}",
                              style: TextStyle(fontSize: 18)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("|", style: TextStyle(fontSize: 18)),
                          ),
                          Text("${addressData[index].phone}",
                              style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.home,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${addressData[index].street} + ${addressData[index].ward} + ${addressData[index].disctrict} + ${addressData[index].city}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.outlined_flag, color: Colors.blue),
                          Text(
                            "Địa chỉ mặc định",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              bottom: 10,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAddress(),
                    ),
                  );
                });
              },
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
                    "Thêm địa chỉ mới",
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
      ),
    );
  }
}
