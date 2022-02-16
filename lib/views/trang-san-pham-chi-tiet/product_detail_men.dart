import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:onboarding_demo/models/api-product-dedtails.dart';
import 'package:onboarding_demo/views/gio-hang/cart_screen.dart';
import 'package:onboarding_demo/views/trang-san-pham-chi-tiet/components/address_delivery.dart';
import 'package:onboarding_demo/views/trang-san-pham-chi-tiet/components/image.dart';
import 'package:onboarding_demo/views/trang-san-pham-chi-tiet/components/product_name.dart';
import 'package:onboarding_demo/views/trang-san-pham-chi-tiet/components/product_price.dart';
import 'package:onboarding_demo/views/trang-san-pham-chi-tiet/components/rating.dart';
import 'package:onboarding_demo/network/product_detail_request.dart';

class ProductDetailMen extends StatefulWidget {
  ProductDetailMen({Key key}) : super(key: key);

  @override
  State<ProductDetailMen> createState() => _ProductDetailMenState();
}

class _ProductDetailMenState extends State<ProductDetailMen> {
  List<api_product_details> productDetailDatas = [];
  Future<api_product_details> _futureProductDetails;

  @override
  void initState() {
    super.initState();
    requestProductDetailAPI.fetchProductDetails().then((dataFromServe) {
      setState(() {
        productDetailDatas = dataFromServe;
      });
    });
  }

  FutureBuilder<api_product_details> buildFutureBuilder() {
    return FutureBuilder<api_product_details>(
      future: _futureProductDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.productID);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int _current = 0;

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
                        child: Swiper(
                          onIndexChanged: (index) {
                            _current = index;
                          },
                          autoplay: true,
                          layout: SwiperLayout.DEFAULT,
                          itemCount: productDetailDatas.length,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      productDetailDatas[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
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
              rating(),

              // giá tiền
              ProductPrice(),

              // địa chỉ người nhận
              AddressDelivery(),
            ],
          ),
        ),
      ),
    );
  }
}
