import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

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
}
