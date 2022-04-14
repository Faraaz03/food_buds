import 'package:flutter/material.dart';
import 'package:food_buds/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  String? productId;
  String? productImage;
  String? productName;
  int? productPrice;

  Count(
      {this.productId, this.productImage, this.productName, this.productPrice});

  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
        height: 30.0,
        width: 50.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: isTrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (count == 1) {
                        setState(() {
                          isTrue = false;
                        });
                      }
                      setState(() {
                        count--;
                      });
                    },
                    child: Icon(
                      Icons.remove,
                      size: 15,
                      color: Color(0xffd0b84c),
                    ),
                  ),
                  Text(
                    '$count',
                    style: TextStyle(
                        color: Color(0xffd0b84c), fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: Icon(
                      Icons.add,
                      size: 15,
                      color: Color(0xffd0b84c),
                    ),
                  )
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });
                    reviewCartProvider.addReviewCartData(
                      cartId: widget.productId,
                      cartName: widget.productName,
                      cartImage: widget.productImage,
                      cartPrice: widget.productPrice,
                      cartQuantity: count,
                    );
                  },
                  child: Text(
                    "ADD",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ));
  }
}
