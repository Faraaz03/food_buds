import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_buds/providers/review_cart_provider.dart';
import 'package:food_buds/screens/search.dart';
import 'package:provider/provider.dart';

import 'count.dart';

class SingleItem extends StatefulWidget {
  bool isBool = false;
  String? productImage;
  String? productName;
  bool? wishList = false;
  int? productPrice;
  String? productId;
  int? productQuantity;
  final void Function()? onDelete;
  var productUnit;

  SingleItem(
      {required this.isBool,
      this.productImage,
      this.productName,
      this.productPrice,
      this.productId,
      this.productQuantity,
      this.onDelete,
      this.wishList,
      this.productUnit});

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  late ReviewCartProvider reviewCartProvider;

  late int count;
  getCount() {
    setState(() {
      count = widget.productQuantity!;
    });
  }

  // @override
  // void initState() {
  //   getCount();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              child: Center(
                child: Image.network(widget.productImage!),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: widget.isBool == false
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.productName!,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.productPrice}\$",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  widget.isBool == false
                      ? GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        title: new Text('Regular'),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: new Text('Medium'),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: new Text('Large'),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Medium",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                ),
                                Center(
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: Color(0xffd6b738),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : Text(widget.productUnit)
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              padding: widget.isBool
                  ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                  : EdgeInsets.only(left: 15, right: 15),
              child: widget.isBool == false
                  ? Count(
                      productId: widget.productId,
                      productImage: widget.productImage,
                      productPrice: widget.productPrice,
                      productName: widget.productName,
                    )
                  // ? Container(
                  //     height: 25,
                  //     width: 50,
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.grey),
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     child: Center(
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Icon(
                  //             Icons.add,
                  //             color: Color(0xffd6b738),
                  //             size: 20,
                  //           ),
                  //           Text(
                  //             "ADD",
                  //             style: TextStyle(color: Color(0xffd6b738)),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   )
                  : Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: widget.onDelete,
                            child: Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 25,
                            width: 70,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (count == 1) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "You've reached the minimum limit.");
                                      } else {
                                        setState(() {
                                          count--;
                                        });
                                        reviewCartProvider.updateReviewCartData(
                                            cartImage: widget.productImage,
                                            cartName: widget.productName,
                                            cartId: widget.productId,
                                            cartPrice: widget.productPrice,
                                            cartQuantity: count);
                                      }
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Color(0xffd6b738),
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    "$count",
                                    style: TextStyle(color: Color(0xffd6b738)),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (count < 10) {
                                        setState(() {
                                          count++;
                                        });
                                        reviewCartProvider.updateReviewCartData(
                                            cartImage: widget.productImage,
                                            cartName: widget.productName,
                                            cartId: widget.productId,
                                            cartPrice: widget.productPrice,
                                            cartQuantity: count);
                                      }
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xffd6b738),
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          ),
          widget.isBool == false
              ? Container()
              : Divider(
                  height: 1,
                  color: Colors.black45,
                )
        ],
      ),
    );
  }
}
