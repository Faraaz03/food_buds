import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_buds/screens/search.dart';

import 'count.dart';

class SingleItem extends StatelessWidget {
  bool isBool = false;
  String? productImage;
  String? productName;
  bool? wishList = false;
  int? productPrice;
  String? productId;
  int? productQuantity;
  final void Function()? onDelete;

  SingleItem(
      {required this.isBool,
      this.productImage,
      this.productName,
      this.productPrice,
      this.productId,
      this.productQuantity,
      this.onDelete,
      this.wishList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              child: Center(
                child: Image.network(productImage!),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: isBool == false
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        productName!,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$productPrice\$",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  isBool == false
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
                      : Text("2")
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              padding: isBool
                  ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                  : EdgeInsets.only(left: 15, right: 15),
              child: isBool == false
                  ? Count(
                      productId: productId,
                      productImage: productImage,
                      productPrice: productPrice,
                      productName: productName,
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
                            onTap: onDelete,
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
                                  Icon(
                                    Icons.remove,
                                    color: Color(0xffd6b738),
                                    size: 20,
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(color: Color(0xffd6b738)),
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Color(0xffd6b738),
                                    size: 20,
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
          isBool == false
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
