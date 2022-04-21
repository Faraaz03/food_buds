import 'package:flutter/material.dart';
import 'package:food_buds/Models/product_model.dart';
import 'package:food_buds/widgets/count.dart';
import 'package:food_buds/widgets/count.dart';
import 'package:food_buds/widgets/product_unit.dart';

class SingleProdcut extends StatefulWidget {
  final String? productImage;
  final String? productName;
  final String? productId;
  final int? productPrice;
  final Function()? onTap;
  final ProductModel? productUnit;

  SingleProdcut(
      {this.productImage,
      this.productName,
      this.productPrice,
      this.onTap,
      this.productId,
      this.productUnit});

  @override
  State<SingleProdcut> createState() => _SingleProdcutState();
}

class _SingleProdcutState extends State<SingleProdcut> {
  var unitData;
  var firstValue;
  @override
  Widget build(BuildContext context) {
    widget.productUnit!.productUnit!.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      return true;
    });
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 230,
            width: 160,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network('${widget.productImage}'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.productName}',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${widget.productPrice}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ProductUnit(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: widget
                                              .productUnit!.productUnit!
                                              .map<Widget>((data) {
                                            return Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10,
                                                      horizontal: 10),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      setState(() {
                                                        unitData = data;
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      data,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            );
                                          }).toList(),
                                          // children: <Widget>[
                                          // ListTile(
                                          //   title: new Text('Regular'),
                                          //   onTap: () {
                                          //     Navigator.pop(context);
                                          //   },
                                          // ),
                                          // ListTile(
                                          //   title: new Text('Medium'),
                                          //   onTap: () {
                                          //     Navigator.pop(context);
                                          //   },
                                          // ),
                                          // ListTile(
                                          //   title: new Text('Large'),
                                          //   onTap: () {
                                          //     Navigator.pop(context);
                                          //   },
                                          // ),
                                          // ],
                                        );
                                      });
                                },
                                title: unitData == null ? firstValue : unitData,
                              ),
                              // child: InkWell(
                              //   onTap: () {

                              //   },
                              //   child: Container(
                              //     padding: EdgeInsets.symmetric(horizontal: 3),
                              //     height: 30.0,
                              //     width: 50.0,
                              //     decoration: BoxDecoration(
                              //       border: Border.all(color: Colors.grey),
                              //       borderRadius: BorderRadius.circular(10),
                              //     ),
                              //     child: Row(
                              //       children: [
                              //         Expanded(
                              //             child: Text(
                              //           "Medium",
                              //           style: TextStyle(fontSize: 10),
                              //         )),
                              //         Center(
                              //           child: Icon(
                              //             Icons.arrow_drop_down,
                              //             size: 20,
                              //             color: Colors.yellow,
                              //           ),
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Count(
                              productId: widget.productId,
                              productImage: widget.productImage,
                              productPrice: widget.productPrice,
                              productName: widget.productName,
                              productUnit:
                                  unitData == null ? firstValue : unitData,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
