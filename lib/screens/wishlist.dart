import 'package:flutter/material.dart';
import 'package:food_buds/Models/product_model.dart';
import 'package:food_buds/Models/review_cart_model.dart';
import 'package:food_buds/providers/review_cart_provider.dart';
import 'package:food_buds/providers/wishlist_provider.dart';
import 'package:food_buds/widgets/single_item.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  late WishlistProvider wishlistProvider;
  showAlertDialog(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        wishlistProvider.deleteWishList(delete.productId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("WishList Product"),
      content: Text("Do you wanna delete this product?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    wishlistProvider = Provider.of(context);
    wishlistProvider.getWishlistData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WishList",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: wishlistProvider.getWishList.length,
        itemBuilder: (context, index) {
          ProductModel data = wishlistProvider.getWishList[index];
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SingleItem(
                isBool: true,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
                productQuantity: data.productQuantity,
                onDelete: () {
                  showAlertDialog(context, data);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
