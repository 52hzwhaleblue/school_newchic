import 'package:flutter/material.dart';

class AddressDelivery extends StatefulWidget {
  const AddressDelivery({
    Key key,
  }) : super(key: key);

  @override
  State<AddressDelivery> createState() => _AddressDeliveryState();
}

class _AddressDeliveryState extends State<AddressDelivery> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
