import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:onboarding_demo/views/gio-hang/cart_screen.dart';

class ProductDetailMen extends StatefulWidget {
  ProductDetailMen({Key key}) : super(key: key);

  @override
  State<ProductDetailMen> createState() => _ProductDetailMenState();
}

class _ProductDetailMenState extends State<ProductDetailMen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // phần hiển thi hình ảnh chi tiết sản phẩm
              Stack(
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.amber,
                        width: size.width,
                        height: size.height * 0.49,
                      ),
                    ],
                  ),
                  new Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: new BoxDecoration(
                        color: Colors.grey[800],
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  new Positioned(
                    top: 20,
                    right: 20,
                    child: Row(
                      children: [
                        Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: new BoxDecoration(
                            color: Colors.grey[800],
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // thông tin chi tiết sản phẩm
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Thông tin chi tiết sản phẩm Thông tin chi tiết sản phẩm",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // đánh giá
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_rate,
                      color: Colors.amber.shade700,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: Colors.amber.shade700,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: Colors.amber.shade700,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: Colors.amber.shade700,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: Colors.amber.shade700,
                    ),
                    Text("(Lượt đánh giá)"),
                  ],
                ),
              ),

              // giá tiền
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "99.000",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Inter',
                      ),
                    ),
                    Text(
                      "đ",
                      style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),

              // địa chỉ người nhận
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Giao đến",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "......địa chỉ.....",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
