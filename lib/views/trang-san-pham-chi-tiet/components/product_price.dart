import 'package:flutter/material.dart';

class ProductPrice extends StatefulWidget {
  const ProductPrice({
    Key key,
  }) : super(key: key);

  @override
  State<ProductPrice> createState() => _ProductPriceState();
}

class _ProductPriceState extends State<ProductPrice> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
