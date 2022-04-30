import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/review_cart_model.dart';

class OrderItem extends StatelessWidget {
  late bool isTrue;
  final ReviewCartModel? e;
  OrderItem({this.e});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        "${e!.cartImage}",
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${e!.cartName}",
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            e!.cartUnit,
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            "\$${e!.cartPrice}",
          ),
        ],
      ),
      subtitle: Text(e!.cartQuantity.toString()),
    );
  }
}
