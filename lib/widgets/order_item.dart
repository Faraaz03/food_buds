import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  late bool isTrue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        "https://www.turnaroundpastor.com/wp-content/uploads/2015/11/hamburger-sandwich-27.png",
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Food Name",
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            "Regular",
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            "\$45",
          ),
        ],
      ),
      subtitle: Text("7"),
    );
  }
}
