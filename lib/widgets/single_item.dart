import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleItem extends StatelessWidget {
  bool isBool = false;
  SingleItem({required this.isBool});

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
                child: Image.network(
                    "https://e7.pngegg.com/pngimages/692/669/png-clipart-big-burger-hamburger-fast-food.png"),
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
                        "Product Name",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "2\$",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  isBool == false
                      ? Container(
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
                                  "1 Burger",
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
                  ? Container(
                      height: 25,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Color(0xffd6b738),
                              size: 20,
                            ),
                            Text(
                              "ADD",
                              style: TextStyle(color: Color(0xffd6b738)),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Icon(
                          Icons.delete,
                          size: 30,
                          color: Colors.black54,
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
                                  Icons.add,
                                  color: Color(0xffd6b738),
                                  size: 20,
                                ),
                                Text(
                                  "ADD",
                                  style: TextStyle(color: Color(0xffd6b738)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
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
