import 'package:flutter/material.dart';

class rating extends StatefulWidget {
  const rating({
    Key key,
  }) : super(key: key);

  @override
  State<rating> createState() => _ratingState();
}

class _ratingState extends State<rating> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
