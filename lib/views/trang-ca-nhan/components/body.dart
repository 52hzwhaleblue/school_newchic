import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:onboarding_demo/views/trang-ca-nhan/components/process_order.dart';
import 'package:onboarding_demo/views/trang-ca-nhan/components/review_products.dart';
import 'package:onboarding_demo/views/trang-ca-nhan/components/user_info.dart';
import 'package:onboarding_demo/views/trang-ca-nhan/components/not_review_product_yet.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          UserInfo(),
          ProcessOrder(size: size),
          ReviewProduct(size: size),
          NotReviewProductYet(),
        ],
      ),
    );
  }
}
