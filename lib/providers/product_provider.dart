import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_buds/Models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> getFoodData = [];
  List<ProductModel> getPizzaData = [];

  late ProductModel productModel;

  List<ProductModel> search = [];

  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
        productImage: element.get("productImage"),
        productName: element.get("productName"),
        productPrice: element.get("productPrice"),
        productId: element.get("productId"));
    search.add(productModel);
  }

  fetchFoodData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Burgers").get();

    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    });
    getFoodData = newList;
    notifyListeners();
  }

  List<ProductModel> get getFoodDataList {
    return getFoodData;
  }

  fetchPizzaData() async {
    List<ProductModel> newList2 = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Pizzas").get();

    value.docs.forEach((element) {
      productModels(element);
      newList2.add(productModel);
    });
    getPizzaData = newList2;
    notifyListeners();
  }

  List<ProductModel> get getPizzaDataList {
    return getPizzaData;
  }

  List<ProductModel> get getAllProductSearch {
    return search;
  }
}
