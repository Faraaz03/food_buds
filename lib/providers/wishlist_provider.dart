import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_buds/Models/product_model.dart';

class WishlistProvider with ChangeNotifier {
  void addWishlistData({
    String? wishlistId,
    String? wishlistImage,
    String? wishlistName,
    int? wishlistQuantity,
    int? wishlistPrice,
  }) async {
    FirebaseFirestore.instance
        .collection("Wishlist")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishlist")
        .doc(wishlistId)
        .set(
      {
        "wishlistId": wishlistId,
        "wishlistName": wishlistName,
        "wishlistImage": wishlistImage,
        "wishlistPrice": wishlistPrice,
        "wishlistQuantity": wishlistQuantity,
        "wishlist": true
      },
    );
  }

  List<ProductModel> wishList = [];

  getWishlistData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("Wishlist")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishlist")
        .get();
    value.docs.forEach((element) {
      ProductModel productModel = ProductModel(
          productId: element.get("wishlistId"),
          productName: element.get("wishlistName"),
          productImage: element.get("wishlistImage"),
          productPrice: element.get("wishlistPrice"),
          productQuantity: element.get("wishlistQuantity"));
      newList.add(productModel);
    });
    wishList = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishList {
    return wishList;
  }

  deleteWishList(wishListId) {
    FirebaseFirestore.instance
        .collection("Wishlist")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishlist")
        .doc(wishListId)
        .delete();
  }
}
